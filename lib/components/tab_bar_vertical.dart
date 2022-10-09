import 'package:flutter/material.dart';

class TabBarVertical extends StatefulWidget {
  const TabBarVertical({
    super.key, 
    required this.width,
    required this.height,
    required this.constraints,
    required this.tabWidth,
    required this.tabs,
    required this.items,
  });

  final double width;
  final double height;
  final BoxConstraints constraints;
  final double tabWidth;
  final List<String> tabs;
  final List<Widget> items;

  @override
  State<TabBarVertical> createState() => _TabBarVerticalState();
}

class _TabBarVerticalState extends State<TabBarVertical> with SingleTickerProviderStateMixin{
  List<bool> boolsHasHoved = [];
  late AnimationController controller;
  Animation<double>? animation;


  int indexSelected = 0;

  bool changing = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this
    )..addListener(() => setState(() {}));

    
    controller.forward();
    for(var i = 0; i < widget.tabs.length; i++){
      if(i == indexSelected){
        boolsHasHoved.add(true);
      }
      else{
        boolsHasHoved.add(false);
      }
    }
  }

  selectTab(index) async {
    if(index != indexSelected){
      setState(() {
        changing = true;
      });
      await controller.reverse();

      setState(() {
        boolsHasHoved[index] = true;
        indexSelected = index;
        changing = false;
      });

      animation = Tween(begin: -20.0, end: 0.0).animate(controller);

      await controller.forward();

      clearHooves();
      
    }
  }

  clearHooves(){
    for(var i = 0; i < boolsHasHoved.length; i++){
      if(i != indexSelected){
        setState(() {
          boolsHasHoved[i] = false;
        });
      }
    }
    
    setState(() {
      boolsHasHoved[indexSelected] = true;
    });
  }

  bool thisTabHasSelected(index){
    if(indexSelected == index){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      constraints: widget.constraints,
      decoration: const BoxDecoration(
        // color: Colors.green
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: widget.tabWidth,
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(widget.tabs.length, 
                (index) {
                  return GestureDetector(
                  onTap: () async => await selectTab(index),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onHover: (event) {
                      setState(() {
                        boolsHasHoved[index] = true;
                      });
                    },
                    onExit: (event) {
                      if(index != indexSelected){
                        setState(() {
                          boolsHasHoved[index] = false;
                        });
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration:  BoxDecoration(
                        color: boolsHasHoved[index] ? Theme.of(context).backgroundColor : null,
                        border: Border(left: BorderSide(color: boolsHasHoved[index] ? Theme.of(context).primaryColor : const Color(0xFF272727), width: 2) )
                      ),
                      child: Text(widget.tabs[index], style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),),
                    ),
                  ),
                );
                }
              )
            )            
          ),
          Column(
            children: [
              AnimatedOpacity(
                opacity: changing ? 0 : 1,
                duration: const Duration(milliseconds: 50),
                child: Transform.translate(
                  offset: Offset(animation != null ? animation!.value : 0, 0),
                  child: Container(
                    margin: const EdgeInsets.only(left: 50),
                    width: widget.width - widget.tabWidth - 50,
                    constraints: widget.constraints.copyWith(
                      maxWidth: 1200 - widget.tabWidth - 50 - 300
                    ),
                    child: widget.items[indexSelected],
                  ),
                ),
              ),
            ],
          )
        ],
      ),

    );
  }
}

class TabModel extends StatelessWidget {
  const TabModel({
    required this.title,
    required this.date,
    required this.highlightedText,
    required this.content,
    Key? key,
  }) : super(key: key);

  final String title;
  final String date;
  final String highlightedText;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SelectableText(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ),
            SelectableText(date, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ],
        ),
        const SizedBox(height: 10),
        SelectableText(highlightedText, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),),
        const SizedBox(height: 20),
        SelectableText(content, style: TextStyle(color: Theme.of(context).secondaryHeaderColor),),
      ],
    );
  }
}
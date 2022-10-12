import 'package:flutter/material.dart';

class TabBarIcons extends StatefulWidget {
  const TabBarIcons({
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
  final List<Widget> tabs;
  final List<Widget> items;

  @override
  State<TabBarIcons> createState() => _TabBarIconsState();
}

class _TabBarIconsState extends State<TabBarIcons> with SingleTickerProviderStateMixin {
  List<bool> boolsHasHoved = [];
  late AnimationController controller;
  Animation<double>? animation;

  int indexSelected = 0;

  bool changing = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 50),
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
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
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
                      padding: const EdgeInsets.all(2),
                      alignment: Alignment.center,
                      decoration:  BoxDecoration(
                        color: boolsHasHoved[index] ? Theme.of(context).backgroundColor : null,
                        border: Border(bottom: BorderSide(color: boolsHasHoved[index] ? Theme.of(context).primaryColor : const Color(0xFF272727), width: 2) )
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: widget.tabs[index],
                      ),
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


class TabModelIcons extends StatelessWidget {
  const TabModelIcons({
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        const SizedBox(height: 20),
        SelectableText(content, style: TextStyle(color: Theme.of(context).secondaryHeaderColor),),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:portifolio/utils/util.dart';

class TabBarText extends StatefulWidget {
  const TabBarText({
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
  State<TabBarText> createState() => _TabBarTextState();
}

class _TabBarTextState extends State<TabBarText> with SingleTickerProviderStateMixin{
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
    );

    animation = Tween(begin: -20.0, end: 0.0).animate(controller)..addListener(() => setState(() {}));
    
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
      boolsHasHoved[index] = true;
      changing = true;
      indexSelected = index;
      setState(() {});
      
      await controller.reverse();

      changing = false;
      setState(() {});

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
    return isLandscape(context) ?
    Container(
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
                    width: widget.width - widget.tabWidth - 50 ,
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
    )
    :
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 475,
      child: Column(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.all(5),
            child: GridView.count(
              childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 3.5),
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
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration:  BoxDecoration(
                          color: boolsHasHoved[index] ? Theme.of(context).backgroundColor : null,
                          border: Border(top: BorderSide(color: boolsHasHoved[index] ? Theme.of(context).primaryColor : const Color(0xFF272727), width: 2) )
                        ),
                        child: Text(widget.tabs[index], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2),),
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
                    // color: Colors.amber,
                    margin: isLandscape(context) ? const EdgeInsets.only(left: 50) : null,
                    width: isLandscape(context) ? widget.width - widget.tabWidth - 50 : MediaQuery.of(context).size.width,
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
    required this.enterprise,
    required this.highlightedText,
    required this.content,
    required this.keywords,
    Key? key,
  }) : super(key: key);

  final String title;
  final String date;
  final String enterprise;
  final String highlightedText;
  final String content;
  final String keywords;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              ),
              Text(date, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(highlightedText, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),),
              Text(enterprise, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),),
            ],
          ),
          const SizedBox(height: 20),
          Text(content, style: TextStyle(color: Theme.of(context).secondaryHeaderColor),),
          const SizedBox(height: 10),
          Text('keywords: $keywords', style: TextStyle(color: Theme.of(context).primaryColor),),
        ],
      ),
    );
  }
}
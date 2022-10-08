// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonOutlinded extends StatefulWidget {
  const ButtonOutlinded({super.key, required this.onTap, required this.name, this.icon, this.color = const Color(0xFF666CDE), this.tooltipMessage});

  final void Function()? onTap;
  final String name;
  final Icon? icon;
  final Color color;
  final String? tooltipMessage;

  @override
  State<ButtonOutlinded> createState() => _ButtonOutlindedState();
}

class _ButtonOutlindedState extends State<ButtonOutlinded> {
  double opacity = 0.15;
  @override
  Widget build(BuildContext context) {
    if(widget.tooltipMessage != null){
      return Tooltip(
        message: widget.tooltipMessage,
        margin: const EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10)                                                    
        ),
        textStyle: const TextStyle(fontSize: 12),
        child: MouseRegion(
          onHover: (e) {
            setState(() {
              opacity = 0.30;
            });
          },
          onExit: (e) {        
            setState(() {
              opacity = 0.15;
            });
          },
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              width: 150,
              duration: const Duration(milliseconds: 100),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: widget.color, width: 3),
                borderRadius: BorderRadius.circular(10),
                color: widget.color.withOpacity(opacity)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  widget.icon ?? const SizedBox(),
                  const SizedBox(width: 10),
                  Text(widget.name, style: const TextStyle(color: Colors.white),),
                ],
              ),
            )
          ),
        )
      );
    }
    return MouseRegion(
      onHover: (e) {
        setState(() {
          opacity = 0.30;
        });
      },
      onExit: (e) {        
        setState(() {
          opacity = 0.15;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          width: 150,
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: widget.color, width: 3),
            borderRadius: BorderRadius.circular(10),
            color: widget.color.withOpacity(opacity)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.icon ?? const SizedBox(),
              const SizedBox(width: 10),
              Text(widget.name, style: const TextStyle(color: Colors.white),),
            ],
          ),
        )
      ),
    );
  }
  
}
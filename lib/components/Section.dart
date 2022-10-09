import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  const Section({
    super.key,
    this.child,
    this.backgroundColor,
    this.opacity = 1,
    this.durationOpacity = const Duration(seconds: 1),
    this.width,
    this.height,
    this.maxWidth,
  });

  final Widget? child;
  final Color? backgroundColor;
  final double opacity;
  final Duration durationOpacity;
  final double? height;
  final double? width;
  final double? maxWidth;

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    return Container(      
      width: MediaQuery.of(context).size.width,                    
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: widget.height ,
            width: widget.width ?? MediaQuery.of(context).size.width * 0.95,
            constraints: BoxConstraints(
              maxWidth: widget.maxWidth ?? 1200
            ),
            child: AnimatedOpacity(
              duration: widget.durationOpacity,
              opacity: widget.opacity,
              child: widget.child
            )
          )  ,
        ],
      ),
    );
  }
}
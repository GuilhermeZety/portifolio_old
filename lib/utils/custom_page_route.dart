import 'package:flutter/cupertino.dart';

class CustomPageRouteDirections extends PageRouteBuilder{
  final Widget child;
  final AxisDirection direction;
  final Duration duration;

  CustomPageRouteDirections({required this.child, this.direction = AxisDirection.right, this.duration = const Duration(milliseconds: 500)}) 
    : super(
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => child
    ); 

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) => 
    
    SlideTransition(
      position: Tween<Offset>(
        begin: getBeginPosition(direction),
        end: Offset.zero
      ).animate(animation),
      child: child
    );
}
Offset getBeginPosition(AxisDirection direction){
  switch (direction) {
    case AxisDirection.up:
      return const Offset(0, 1);
    case AxisDirection.down:
      return const Offset(0, -1);
    case AxisDirection.right:
      return const Offset(-1, 0);
    case AxisDirection.left:
      return const Offset(1, 0);
  }
}

class CustomPageRouteScale extends PageRouteBuilder{
  final Widget child;

  CustomPageRouteScale({required this.child}) 
    : super(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => child
    );


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) => 
    
    ScaleTransition(
      scale: animation,
      child: child
    );
}

class CustomPageRouteFade extends PageRouteBuilder{
  final Widget child;
  final Duration duration;

  CustomPageRouteFade({required this.child, this.duration = const Duration(milliseconds: 500), RouteSettings? settings}) 
    : super(
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      settings: settings
    );


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) => 
    
    FadeTransition(
      opacity: animation,
      child: child
    );
}
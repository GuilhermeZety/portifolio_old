import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void showToast({
  required FToast fToast,
  required String title,
  required Widget message,
  required Duration duration,
  Color color = Colors.white,
  Color backgroundColor = Colors.white,
  Icon icon = const Icon(Icons.verified)
}) {
  fToast.showToast(
    gravity: ToastGravity.TOP_RIGHT,
    toastDuration: duration,
    child: Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8)

      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(7), 
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(blurRadius: 4,color: Colors.black.withOpacity(0.23), offset: const Offset(0, 0), spreadRadius: 1)
                  ]
                ),            
                child: Container(            
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(100)),
                  child: icon,
                ),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                width: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey.shade900),),
                    Row(
                      children: [
                        message,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // IconButton(icon: Icon(Icons.close, color: Theme.of(this).snackBarTheme.contentTextStyle!.color,), onPressed: () => _closeSnackbar(),),
        ],
      ),
    )
  );
}

showSuccessToast({required String message, required FToast fToast, Duration? duration}){
  showToast(
    fToast: fToast, 
    title: 'Sucesso!',
    duration: duration ?? const Duration(seconds: 4),
    message: Expanded(child: Text(message, style: TextStyle(color: Colors.grey.shade800),)),
    // backgroundColor: Color(0xFFB7FFD6).withOpacity(0.7), 
    backgroundColor: const Color(0xFFf1f8f4), 
    color: const Color(0xFF50dc6c), 
    icon: const Icon(FontAwesomeIcons.check, color: Color(0xFF50dc6c), size: 18,)
  );
}
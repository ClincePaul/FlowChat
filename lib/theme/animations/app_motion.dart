import 'package:flutter/widgets.dart';

class AppMotion {
  AppMotion._();
  static const Duration fast       = Duration(milliseconds: 200);
  static const Duration medium     = Duration(milliseconds: 300);
  static const Duration mediumLow  = Duration(milliseconds: 400);
  static const Duration slow       = Duration(milliseconds: 500);
  static const Duration verySlow   = Duration(milliseconds: 600);
  static const Duration ultraSlow  = Duration(milliseconds: 800);

  static const Curve standard      = Curves.easeInOut;   
  static const Curve enter         = Curves.easeOut;     
  static const Curve exit          = Curves.easeIn;      
  static const Curve emphasized    = Curves.easeInOut;   

  
  static const Curve bounce        = Curves.easeOutBack;
  static const Curve smooth        = Curves.easeInOutCubic;
  static const Curve decelerate    = Curves.easeOutCubic; 

  
  static const int staggerUnit = 80; 
}

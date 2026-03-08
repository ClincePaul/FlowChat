import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final uiThemeProvider = StateProvider((ref){
  return  const Color.fromARGB(255, 50, 78, 202);
});
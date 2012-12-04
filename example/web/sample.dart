/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * @nicofrancois wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Nicolas François
 * ----------------------------------------------------------------------------
 */
library konami_code_sample;

import "dart:html";
import 'package:konami_code/konami_code.dart';

main(){
  konamiCode.on.performed.add(_changeText);
}

_changeText(KonamiCodeEvent event){
  query('#container').text = "Konami code performed !";
}

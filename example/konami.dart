/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * Nicolas Francois wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Nicolas François
 * ----------------------------------------------------------------------------
 */

import "package:konami_code/konami_code.dart";
import "dart:html";

void main() {
  var konami = new KonamiCode();
  konami.onPerformed.listen((_) => onSuccess());
}

onSuccess() =>
  success.classes..remove("out")
                 ..add("in");

Element get success => query("#success");
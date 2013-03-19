#import("lib/konami_code.dart");
#import('dart:html');

void main() {
  var konami = new KonamiCode();
  konami.onPerformed = onSuccess;
}

onSuccess() {
  success.classes..remove("out")
                 ..add("in");
}

Element get success => query("#success");



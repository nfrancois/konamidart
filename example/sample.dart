#import("dart:html");

#import('packages/konami_code/konami_code.dart');


main(){
  var konami = new KonamiCode();
  konami.onPerformed = _changeText;
}

_changeText(){
  query('#container').text = "Konami code performed !";
}
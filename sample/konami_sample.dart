#import("../konami_code.dart");
#import("dart:html");


main(){
  var konami = new KonamiCode();
  konami.onPerformed = _changeText;
}

_changeText(){
  query('#container').text = "Konami code performed !";
}

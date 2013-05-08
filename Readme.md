#Konami Code Dart
A Dart implementation for Konami Code.

Try perform it [here](http://nfrancois.github.com/konamidart).

## Sample

```dart
import "dart:html";
import 'package:konami_code/konami_code.dart';

main(){
  konami.onPerformed.listen((_) => _changeText());
}

_changeText()=>
  query('#container').text = "Konami code performed !";

```

Stream give code sequence as string.

## Special code

Want to use your own code ?

```dart`
// Up Up !
new KonamiCode("3838").onPerformed.listen((_) => doSomething());
// Down down !
new KonamiCode.fromCharCodes([40,4]").onPerformed.listen((_) => doSomething());
``
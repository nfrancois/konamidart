#Konami Code Dart
A Dart implementation for Konami Code.

```dart
import "dart:html";
import 'package:konami_code/konami_code.dart';

main(){
  konamiCode.on.performed.add(_changeText);
}

_changeText(KonamiCodeEvent event){
  query('#container').text = "Konami code performed !";
}
```

Try perform it [here](http://nfrancois.github.com/konamidart/).

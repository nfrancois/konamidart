#Konami Code Dart
A Dart implementation for Konami Code.

```dart
import "dart:html";
import 'package:konami_code/konami_code.dart';

main(){
  konamiCode.onPerformed = _changeText;
}

_changeText(){
  query('#container').text = "Konami code performed !";
}
```

Try perform it [here](http://nfrancois.github.com/konamidart/).

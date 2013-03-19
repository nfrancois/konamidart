#library('konami_code');
#import('dart:html');

class KonamiCode {
  
  const String KONAMICODE_SEQUENCE = "38384040373937396665";
  
  var _onPerformedCallback;
  String _lastInputs;
  
  KonamiCode(){
    _lastInputs = "";
    window.on.keyDown.add(_onKeyDown);
  }
  
  _onKeyDown(KeyboardEvent event){
    var keyCode = event.keyCode;
    _lastInputs = _lastInputs.concat(keyCode.toString());
    if(KONAMICODE_SEQUENCE == _lastInputs){
      _lastInputs = "";
      if(_onPerformedCallback != null){
        _onPerformedCallback();        
      }
    } else if(_lastInputs.length > KONAMICODE_SEQUENCE.length){
      _lastInputs = _lastInputs.substring(_lastInputs.length-KONAMICODE_SEQUENCE.length);
    }
  }
  
  void set onPerformed(callback()) {
    _onPerformedCallback = callback;
  }
  
}
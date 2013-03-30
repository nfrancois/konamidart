/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * @nicofrancois wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Nicolas François
 * ----------------------------------------------------------------------------
 */
library konami_code;

import 'dart:html';

KonamiCode _konamiCode;

/// Get access to Konami Code.
KonamiCode get konamiCode {
  if(_konamiCode == null){
    _konamiCode = new KonamiCode();
  }
  return _konamiCode;
}


class KonamiCode {
  
  const KONAMICODE_SEQUENCE = "38384040373937396665";
  
  var _onPerformedCallback;
  String _lastInputs;
  
  KonamiCode(){
    _lastInputs = "";
    window.onKeyDown.listen(_onKeyDown);
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
  
  set onPerformed(callback()) {
    _onPerformedCallback = callback;
  }
  
}
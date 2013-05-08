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
import 'dart:async';

KonamiCode _konamiCode;

/**
 * Give a konami code entry.
 */
KonamiCode get konamiCode => new KonamiCode();

/**
 * Manage konami code execution.
 */
class KonamiCode {
  
  const KONAMICODE_SEQUENCE = "38384040373937396665";
  
  final List<StreamController> _controllers = [];
  String _lastInputs;
  
  KonamiCode(){
    _lastInputs = "";
    window.onKeyDown.listen(_onKeyDown);
  }
  
  _onKeyDown(KeyboardEvent event){
    var keyCode = event.keyCode;
    _lastInputs = _lastInputs + keyCode.toString();
    if(KONAMICODE_SEQUENCE == _lastInputs){
      _lastInputs = "";
      _controllers.forEach((controller) => controller.add(true));
    } else if(_lastInputs.length > KONAMICODE_SEQUENCE.length){
      _lastInputs = _lastInputs.substring(_lastInputs.length-KONAMICODE_SEQUENCE.length);
    }
  }
  
  /**
   * When sequence is performed.
   */
  Stream<bool> get onPerformed {
    StreamController<bool> controller = new StreamController();
    _controllers.add(controller);
    return controller.stream;
  }
  
}
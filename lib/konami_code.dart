/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * Nicolas Francois wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Nicolas François
 * ----------------------------------------------------------------------------
 */
library konami_code;

import 'dart:html';
import 'dart:async';

/**
 * Give a konami code entry.
 */
KonamiCode get konamiCode => new KonamiCode();

/**
 * Manage konami code execution.
 */
class KonamiCode {
  
  final String sequence;
  final List<StreamController> _controllers = [];
  String _lastInputs;
  
  /**
   * KonamiCode constructor.
   * [sequenceCode] default value is Konami Code
   */
  // 38384040373937396665 is konami code sequence
  KonamiCode({String sequenceCode : "38384040373937396665"}) : sequence = sequenceCode {
    _init();
  }
  
  /**
   * KonamiCode named constructor from char codes.
   * [charCodes] ascii codes.
   */  
  KonamiCode.fromCharCodes(List<int> charCodes) : sequence = new String.fromCharCodes(charCodes) {
    _init();
  }
  
  _init(){
    _lastInputs = "";
    window.onKeyDown.listen(_onKeyDown);    
  }
  
  _onKeyDown(KeyboardEvent event){
    var keyCode = event.keyCode;
    _lastInputs = _lastInputs + keyCode.toString();
    if(sequence == _lastInputs){
      _controllers.forEach((controller) => controller.add(_lastInputs));
      _lastInputs = "";
    } else if(_lastInputs.length > sequence.length){
      _lastInputs = _lastInputs.substring(_lastInputs.length-sequence.length);
    }
  }
  
  /**
   * When sequence is performed.
   */
  Stream<String> get onPerformed {
    StreamController<String> controller = new StreamController();
    _controllers.add(controller);
    return controller.stream;
  }
  
}
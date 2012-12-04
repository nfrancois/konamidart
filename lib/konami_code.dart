library konami_code;

import 'dart:html';


KonamiCode _konamiCode;

/// Get access to konami code.
KonamiCode get konamiCode {
  if(_konamiCode == null){
    _konamiCode = new _KonamiCodeImpl();
  }
  return _konamiCode;
}

/**
 * Encapsulates Konami code execution by listening keyboard.
 */
abstract class KonamiCode {

  KonamiCodeEvents get on;
  
}

/**
 * Konami code events.
 */ 
class KonamiCodeEvents {
 
  final KonamiCodeEventListenerList _onPerformedEvents;
  
  KonamiCodeEvents() : _onPerformedEvents = new KonamiCodeEventListenerList();
  
  KonamiCodeEventListenerList get performed => _onPerformedEvents;
 
}

/**
 * Encapsulate all Konami code listeners
 */ 
class KonamiCodeEventListenerList {
  
  List<KonamiCodeHandler> _listeners; 
  
  KonamiCodeEventListenerList(){
    _listeners = [];
  }
  
  /**
   * Add a Konamide code hander to listener list.
   */ 
  add(KonamiCodeHandler handler) {
    _listeners.add(handler);
  }
  
  _dispatch(){
    _listeners.forEach((handler) => handler());
  }
  
}

/**
 * Call when Konami code is performed.
 */ 
typedef void KonamiCodeHandler();


class _KonamiCodeImpl implements KonamiCode {
  
  /// Konami code execution
  static const _KONAMICODE_SEQUENCE = "38384040373937396665";
  
  final KonamiCodeEvents _events;
  String _lastInputs;
  
  _KonamiCodeImpl() :  _events = new KonamiCodeEvents() {
    _lastInputs = "";
    _bind();
  }
  
  _bind(){
    window.on.keyDown.add(_onKeyDown);
  }
  
  _onKeyDown(KeyboardEvent event){
    var keyCode = event.keyCode;
    _lastInputs = _lastInputs.concat(keyCode.toString());
    if(_KONAMICODE_SEQUENCE == _lastInputs){
      _lastInputs = "";
      on.performed._dispatch();
    } else if(_lastInputs.length > _KONAMICODE_SEQUENCE.length){
      _lastInputs = _lastInputs.substring(_lastInputs.length-_KONAMICODE_SEQUENCE.length);
    }
  }
  
 KonamiCodeEvents get on => _events;
  
}
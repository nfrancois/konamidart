library konami_code;

import 'dart:html';


KonamiCode _konamiCode;

/// Get access to Konami Code.
KonamiCode get konamiCode {
  if(_konamiCode == null){
    _konamiCode = new _KonamiCodeImpl();
  }
  return _konamiCode;
}

/**
 * A Konami Code event. 
 */
class KonamiCodeEvent {
  
  final String type;
  
  KonamiCodeEvent.performed() : type = "performed";
  
  String toString() => type;  
}

/**
 * Encapsulates Konami Code execution by listening keyboard.
 */
abstract class KonamiCode {

  /**
   * Provide events.
   */
  KonamiCodeEvents get on;
  
}

/**
 * Provides access to Konami Code events listeners.
 */ 
class KonamiCodeEvents {
 
  final KonamiCodeEventListenerList _onPerformedEvents;
  
  KonamiCodeEvents() : _onPerformedEvents = new KonamiCodeEventListenerList();
  
  /**
   * Call when Konami Code is performed.
   */
  KonamiCodeEventListenerList get performed => _onPerformedEvents;
 
}

/**
 * Encapsulate all Konami Code listeners.
 */ 
class KonamiCodeEventListenerList {
  
  final Set<KonamiCodeListener> _listeners; 
  
  KonamiCodeEventListenerList() : _listeners = new Set<KonamiCodeListener>();
  
  /**
   * Add a Konamide Code listener to listener list.
   */ 
  add(KonamiCodeListener listener) => _listeners.add(listener);
  
  remove(KonamiCodeListener listener) => _listeners.remove(listener);
  
  _dispatch(KonamiCodeEvent event) => _listeners.forEach((listener) => listener(event));
  
}

/**
 * Call when Konami Code is performed.
 */ 
typedef void KonamiCodeListener(KonamiCodeEvent event);


class _KonamiCodeImpl implements KonamiCode {
  
  /// Konami Code ascii sequence
  static const _KONAMICODE_SEQUENCE = "38384040373937396665";
  
  final KonamiCodeEvents _events;
  String _lastInputs;
  
  _KonamiCodeImpl() :  _events = new KonamiCodeEvents() {
    _lastInputs = "";
    _bind();
  }
  
  _bind() => window.on.keyDown.add(_onKeyDown);
  
  _onKeyDown(KeyboardEvent event){
    var keyCode = event.keyCode;
    _lastInputs = _lastInputs.concat(keyCode.toString());
    if(_KONAMICODE_SEQUENCE == _lastInputs){
      _lastInputs = "";
      on.performed._dispatch(new KonamiCodeEvent.performed());
    } else if(_lastInputs.length > _KONAMICODE_SEQUENCE.length){
      _lastInputs = _lastInputs.substring(_lastInputs.length-_KONAMICODE_SEQUENCE.length);
    }
  }
  
 KonamiCodeEvents get on => _events;
  
}
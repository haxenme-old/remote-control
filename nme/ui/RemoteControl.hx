package nme.ui;


import nme.events.EventDispatcher;
import nme.events.RemoteControlEvent;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end


/**
 * Add support for input from a remote control
 * @author Philippe Elsass
 * @author Joshua Granick
 */
class RemoteControl {
	
	
	public static var VOLUME_UP = 0x000002;
	public static var VOLUME_DOWN = 0x000004;
	public static var MENU = 0x000008;
	public static var PLAY_PAUSE = 0x000010;
	public static var NEXT = 0x000020;
	public static var PREVIOUS = 0x000040;
	public static var MENU_LONG_PRESS = 0x000200;
	public static var NEXT_LONG_PRESS = 0x000800;
	public static var PREVIOUS_LONG_PRESS = 0x001000;
	
	private static var dispatcher = new EventDispatcher ();
	private static var initialized:Bool;
	
	
	public static function addEventListener (type:String, listener:Dynamic -> Void, useCapture:Bool = false, priority:Int = 0, useWeakReference:Bool = false):Void {
		
		initialize ();
		
		dispatcher.addEventListener (type, listener, useCapture, priority, useWeakReference);
		
	}
	
	
	public static function hasEventListener (type:String):Bool {
		
		return dispatcher.hasEventListener (type);
		
	}
	
	
	private static function initialize ():Void {
		
		if (!initialized) {
			
			initialized = true;
			
			#if mac
			remote_set_handler (this_onInput);
			#end
			
		}
		
	}
	
	
	public static function removeEventListener (type:String, listener:Dynamic -> Void, useCapture:Bool = false):Void {
		
		dispatcher.removeEventListener (type, listener, useCapture);
		
	}
	
	
	
	
	// Event Handlers
	
	
	
	
	private static function this_onInput (input:Dynamic):Void {
		
		var type = RemoteControlEvent.BUTTON_DOWN;
		
		if (input.type == 2) {
			
			type = RemoteControlEvent.BUTTON_UP;
			
		}
		
		//trace (event.data);
		
		dispatcher.dispatchEvent (new RemoteControlEvent (type, false, false, input.value));
		
	}
	
	
	
	
	// Native Methods
	
	
	
	
	#if (cpp || neko)
	private static var remote_set_handler = Lib.load ("remote-control", "remote_set_handler", 1);
	#end
	
	
}
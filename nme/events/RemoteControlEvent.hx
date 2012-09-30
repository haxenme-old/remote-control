package nme.events;


import nme.events.Event;


class RemoteControlEvent extends Event {
		
	
	public static var BUTTON_DOWN:String = "buttonDown";
	public static var BUTTON_UP:String = "buttonUp";
	
	public var code:Int;
	
	
	public function new (type:String, bubbles:Bool = false, cancelable:Bool = false, code:Int = 0):Void {	
		
		super (type, bubbles, cancelable);
		
		this.code = code;
		
	}
	
	
	public override function clone ():Event {
		
		return new RemoteControlEvent (type, bubbles, cancelable, code);
		
	}
	
	
	public override function toString ():String {
		
		return "[RemoteControlEvent type=" + type + " bubbles=" + bubbles + " cancelable=" + cancelable + " code=" + code + "]";
		
	}
	
	
}
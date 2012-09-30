Remote Control
==============

Add support for remote control input.

Currently it only supports the Apple Remote on an OS X machine, but in the future this may be expanded to support more devices.


Setup
=====

First, install "remote-control" using haxelib

    haxelib install remote-control

Then add the following to your NME project file

    <haxelib name="remote-control" />


How-to-use
==========

Here is an example of how you can use the library

    import nme.display.Sprite;
    import nme.events.RemoteControlEvent;
    import nme.ui.RemoteControl;
    
    class RemoteControlExample extends Sprite {
    	
    	public function new () {
    		
    		super ();
    
    		RemoteControl.addEventListener (RemoteControlEvent.BUTTON_DOWN, RemoteControl_onButtonDown);
    		
    	}
    	
    	private function RemoteControl_onButtonDown (event:RemoteControlEvent):Void {
    		
    		switch (event.code) {
    			
    			case RemoteControl.NEXT: trace ("Pressed next button");
    			case RemoteControl.PREVIOUS: trace ("Pressed previous button");
    		
    		}
    	
    	}
    	
    }

You can also listen for BUTTON_UP, and there are numerous other button codes available.
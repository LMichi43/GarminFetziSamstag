using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Time.Gregorian;

class FetziWatchfaceView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }
    
    

	function showTime(today, seconds) {
		var view = View.findDrawableById("TimeLabel");
		if(seconds)
		{		
		view.setText(Lang.format(
    		"$1$:$2$:$3$",
    		[
	        	today.hour.format("%02d"),
        		today.min.format("%02d"),
        		today.sec.format("%02d")
    		]
			));
		}
		else
		{
			view.setText(Lang.format(
    		"$1$:$2$",
    		[
	        	today.hour.format("%02d"),
        		today.min.format("%02d")    		
        	]
			));
		}
    }
	

	function showFetzi(today){
		var fetzitime = today.day_of_week == Gregorian.DAY_SATURDAY;	
		var view = View.findDrawableById("FetziLabel");
		if(fetzitime)
		{
			view.setText("  ______   ______   _______   ______  _____ \n|  ____| |  ____| |__   __| |___  / |_   _|\n| |__    | |__       | |       / /    | |  \n|  __|   |  __|      | |      / /     | |  \n| |      | |____     | |     / /__   _| |_ \n|_|      |______|    |_|    /_____| |_____|");
			//view.setColor(Graphics.COLOR_LT_GRAY);
		}
		else
		{
			view.setText("\n\n\nNicht Fetzi Samstag!");
			//view.setColor(Graphics.COLOR_LT_GRAY);
		}
	}


    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {

		var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT );
		showTime(today, false);	
		showFetzi(today);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
		var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT );
    }

}

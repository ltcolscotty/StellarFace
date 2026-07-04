using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.WatchUi;

class CometView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Graphics.Dc) as Void {
    }

    // Called when this View is brought to the foreground. Restore the state
    // of this View and prepare it to be shown. This includes loading
    // resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Graphics.Dc) as Void {
        // Get the current time
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);

        // Clear the screen to black
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        // Draw the time string in the center of the screen
        var viewWidth = dc.getWidth();
        var viewHeight = dc.getHeight();
        
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            viewWidth / 2, 
            viewHeight / 2, 
            Graphics.FONT_LARGE, 
            timeString, 
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );
        
        // Always call the base class onUpdate to draw any layout resources
        WatchFace.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the state of this View here.
    function onHide() as Void {
    }

    // The user has issued a temporary purge of instructions to clear the screen
    function onPowerBudgetExceeded(powerInfo as WatchUi.PowerBudget) as Void {
    }
}

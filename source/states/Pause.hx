package states;

import flixel.FlxSubState;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.FlxG;

class Pause extends FlxSubState 
{
	private var closeBtn:FlxButton;
	private var buttonQuit:FlxButton;

	  public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
    {
        super(BGColor);
        FlxG.mouse.visible = true;
        var x:Int = Math.floor(FlxG.width / 2 - 40);
        closeBtn = new FlxButton(x, 300, "Return to Game", returnToGame);

        buttonQuit = new FlxButton(x, 400, "Exit Game", exit);

        add(closeBtn);
        add(buttonQuit);
    }

    function returnToGame()
    {
        this.close();
    }

    function exit()
    {
        FlxG.switchState(new Menu());
    }
	
}
package;

import states.PlayState;
import flixel.FlxGame;
import openfl.display.Sprite;
import flixel.FlxState;
import states.Menu;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, Menu,1,60,60,true,false));
	}
}
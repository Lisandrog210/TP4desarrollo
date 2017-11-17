package;

import states.PlayState;
import flixel.FlxGame;
import openfl.display.Sprite;
import flixel.FlxState;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, PlayState,1,60,60,true,false));
	}
}
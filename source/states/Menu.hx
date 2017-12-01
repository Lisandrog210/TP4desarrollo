package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class Menu extends FlxState 
{
	private var PlayButton:FlxButton;
	private var Title: FlxText;
	private var Text: FlxText;
	private var Text2: FlxText;
	
	override public function create():Void 
	{
		super.create();
		
		Title = new FlxText(160, 5, FlxG.width, "Olive Rush!");
		Title.setFormat(null, 48, FlxColor.RED);
		add(Title);
		
		Text = new FlxText(100, 120, FlxG.width, "Press 'Space' to continue");
		Text.setFormat(null, 30, FlxColor.ORANGE);
		add(Text);
		
		Text2 = new FlxText(200, 160, FlxG.width, "Kill 40 olives to win!");
		Text2.setFormat(null, 16);
		add(Text2);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.SPACE) 
		{
			ClickPlay();
		}
	}
	
	function ClickPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
	
}
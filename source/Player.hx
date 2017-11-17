package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;



enum Directions
{
	RIGHT;
	LEFT;
	UP;
	DOWN;
	RIGHTUP;
	RIGHTDOWN;
	LEFTUP;
	LEFTDOWN;
}

enum States
{
	IDLE;
	RUN;			
	THROW;
	IMMORTAL;
	DEAD;
	
	
}

class Player extends FlxSprite 
{	
	private var currentState:States;
	private var currentDirection:Directions;
	public var angularpos(get, null):Float;

	function get_angularpos():Float 
	{
		return angularpos;
	}

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		animation.add("south1", [0, 3],12, true, false, false);
		animation.add("south2", [0, 3],12, true, false, false);
		animation.add("down", [0,3], 12, true, false, false);
		animation.add("diagdown", [0,3], 12, true, false, false);
		animation.add("diagup", [0,3], 12, true, false, false);
		animation.add("north",[0,3], 12, true, false, false);
		animation.add("down",[0], 12, true, false, false);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		angularpos = Math.atan((FlxG.mouse.y - y) / (FlxG.mouse.x - x));
	}
	
	private function stateMachine()
	{
		switch(currentState)
		{
			case States.IDLE:
				if () 
				{
					
				}
				animation.play("down");
				
				
				
		}
	}
	
}
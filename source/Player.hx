package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxAngle;


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
	private var angularpos:Float;
	public var exp:Int;
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.player__png, false, 17, 13);
		currentState = States.IDLE;
		exp = 0;		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		stateMachine();
		setDirection();
		Reg.PlayerPosX = x;
		Reg.PlayerPosY = y;
		
	}	

	private function stateMachine()
	{
		switch (currentState)
		{
			case States.IDLE:
				move();				

			case States.RUN:			
				move();	
				
			case States.THROW:

			case States.IMMORTAL:			
				
			case States.DEAD:
				
		} 
	}	

	function move()
	{

		if (FlxG.keys.pressed.D)
		{
			currentState = States.RUN;
			if(exp<100)
				velocity.x = 200;
					else
						velocity.x = 500;
		}
		
		else if (FlxG.keys.pressed.S)
		{
			currentState = States.RUN;
			if(exp<100)
				velocity.y = 200;
					else
						velocity.y = 500;
		}
		else if (FlxG.keys.pressed.A)
		{
			currentState = States.RUN;
			if(exp<100)
				velocity.x = -200;
					else	
						velocity.x = -500;
		}
		
		else if (FlxG.keys.pressed.W)
		{
			currentState = States.RUN;
			if(exp<100)
				velocity.y = -200;
					else
						velocity.y = -500;
		}
		else
		{
			velocity.x = 0;
			velocity.y = 0;
		}

	}
	function setDirection()
	{
		angularpos = Math.atan((FlxG.mouse.y - y) / (FlxG.mouse.x - x));		
		if (x>FlxG.mouse.x)
			angularpos += Math.PI;
			
		angle = angularpos * FlxAngle.TO_DEG;
		
		
	}
	
	public function get_exp():Int 
	{
		return exp;
	}
	
	public function set_exp(value:Int):Int 
	{
		return exp = value;
	}
	
	
}
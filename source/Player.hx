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
	SHOOT;
}

class Player extends FlxSprite
{
	private var currentState:States;
	private var currentDirection:Directions;
	private var angularpos:Float;
	private var gotWeapon:Bool;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.character1__png, true, 16, 21);
		animation.add("down", [17, 18, 19, 29], 12, true, false, false);
		animation.add("idle", [8], 12, true, false, false);
		animation.add("rightdown", [0, 1, 2, 3], 12, true, false, false);
		animation.add("leftdown", [0,1,2,3], 12, true, true, false);
		animation.add("rightup", [4, 5, 6, 7], 12, true, false, false);
		animation.add("leftup", [4,5,6,7], 12, true, true, false);
		animation.add("up",[9,10,11,12], 12, true, false, false);
		animation.add("right",[13,14,15,16], 12, true, false, false);
		animation.add("left", [13, 14, 15, 16], 12, true, true, false);
		angularpos = Math.atan((FlxG.mouse.y - y) / (FlxG.mouse.x - x));
		currentState = States.IDLE;
		currentDirection = Directions.DOWN;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		stateMachine();
		setDirection();
	}

	private function stateMachine()
	{
		switch (currentState)
		{
			case States.IDLE:
				move();
				switch (currentDirection)
				{
					case Directions.DOWN:
						animation.play("idle");
					case Directions.UP:
						animation.play("up");
						animation.curAnim.pause;
					case Directions.LEFT:
						animation.play("left");
						animation.curAnim.pause;
					case Directions.RIGHT:
						animation.play("right");
						animation.curAnim.pause;
					case Directions.RIGHTUP:
						animation.play("rightup");
						animation.curAnim.pause;
					case Directions.RIGHTDOWN:
						animation.play("rightdown");
						animation.curAnim.pause;
					case Directions.LEFTUP:
						animation.play("leftup");
						animation.curAnim.pause;
					case Directions.LEFTDOWN:
						animation.play("leftdown");
						animation.curAnim.pause;
				}

			case States.RUN:
				move();
				switch (currentDirection)
				{
					case Directions.DOWN:
						animation.play("idle");
					case Directions.UP:
						animation.play("up");
					case Directions.LEFT:
						animation.play("left");
					case Directions.RIGHT:
						animation.play("right");
					case Directions.RIGHTUP:
						animation.play("rightup");
					case Directions.RIGHTDOWN:
						animation.play("rightdown");
					case Directions.LEFTUP:
						animation.play("leftup");
					case Directions.LEFTDOWN:
						animation.play("leftdown");
				}
			case States.THROW:

			case States.IMMORTAL:

			case States.SHOOT:

			case States.DEAD:

		}
	}

	

	function move()
	{
		velocity.x = 0;
		velocity.y = 0;

		if (FlxG.keys.justPressed.D)
		{
			currentState = States.RUN;
			velocity.x += 5;

		}
		else if (FlxG.keys.justPressed.S)
		{
			velocity.y += 5;
		}
		else if (FlxG.keys.justPressed.A)
		{
			velocity.x += -5;
		}
		else if (FlxG.keys.justPressed.W)
		{
			velocity.y += -5;
		}
	}
	function setDirection()
	{
		if (angle >337.5 && angle < 22.5)
			currentDirection = Directions.UP;
				else if (angle > 22.5 && angle < 67.5)
					currentDirection = Directions.RIGHTUP;
						else if (angle > 67.5 && angle < 112.5)
							currentDirection = Directions.RIGHT;
								else if (angle > 112.5 && angle<157.5)
									currentDirection = Directions.RIGHTDOWN;
										else if (angle >157.5 && angle<202.5)
											currentDirection == Directions.DOWN;
												else if (angle > 202.5 && angle < 247.5)
													currentDirection = Directions.LEFTDOWN;
														else if (angle > 247.5 && angle < 292.5)
															currentDirection = Directions.LEFT;
																else if (angle > 292.5 && angle < 337.5)
																	currentDirection = Directions.LEFTUP;
														
	}
}
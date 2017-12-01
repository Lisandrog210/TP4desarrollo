package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxPoint;
import flixel.math.FlxVelocity;
import flixel.math.FlxRandom;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;


class RedS extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.redSlime__png, true, 32, 32);
		animation.add("bounce",[0,1],6,true);
		animation.play("bounce");
		movement();		
	}
	
	function movement() 
	{
		velocity.x = -80;
		var v = y + 50;
		FlxTween.tween(this, { y: v }, 1, {type:FlxTween.PINGPONG, ease: FlxEase.sineInOut});
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
	
	

}
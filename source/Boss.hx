package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Boss extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.boss__png, true, 32, 32);
		scale.set(4, 4);
		updateHitbox();
		animation.add("bounce",[0,1],6,true);
		animation.play("bounce");		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		move();
	}
	
	function move() 
	{
		velocity.x = -80;
        var v = y + 50;
        FlxTween.tween(this, { y: v }, 1, {type:FlxTween.PINGPONG, ease: FlxEase.sineInOut});
	}
	
}
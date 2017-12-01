package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxAngle;
import flixel.util.FlxTimer;


class Bullets extends FlxSprite 
{
	private var angularpos:Float;
	public var bulletX(default, set):Float;
	public var bulletY(default, set):Float;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.square__png,false,1,1);
		scale.set(5, 5);
		updateHitbox();
		bulletX = 0;
		bulletY = 0;
		setDirection();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		//angle = FlxAngle.angleBetweenMouse(this, true);		
		setDirection();
		//move();
		//limit();
		
	}
	
	function move() 
	{	
		angle = FlxAngle.angleBetweenMouse(this, true);		
		velocity.x = Math.cos(angle * FlxAngle.TO_RAD) * 800;
		velocity.y = Math.sin(angle * FlxAngle.TO_RAD) * 800;
		
	}
	
	function limit() 
	{
		if(alive && !this.isOnScreen(FlxG.camera)){
			kill();
		}
		
	}
	function setDirection()
	{
		angularpos = Math.atan((FlxG.mouse.y - y) / (FlxG.mouse.x - x));		
		if (x>FlxG.mouse.x)
			angularpos += Math.PI;
			
		angle = angularpos * FlxAngle.TO_DEG;		
	}
	
	public function set_bulletX(value:Float):Float 
	{
		return bulletX = value;
	}
	
	public function set_bulletY(value:Float):Float 
	{
		return bulletY = value;
	}
	
	override public function reset(X:Float, Y:Float):Void 
	{
		super.reset(X, Y);
		velocity.x = bulletX;
		velocity.y = bulletY;
	}
	
}
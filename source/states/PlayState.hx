package states;

import flixel.FlxBasic;
import flixel.FlxState;
import Player;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.ui.FlxBar;
import Boss;
import flixel.math.FlxAngle;
import flixel.util.FlxTimer;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.math.FlxPoint;
import flixel.addons.effects.FlxTrail;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var player:Player;
	private var loader:FlxOgmoLoader;
	private var tilemap:FlxTilemap;
	private var redG:FlxTypedGroup<RedS>;
	private var purpleG:FlxTypedGroup<PurpleS>;
	private var greenG:FlxTypedGroup<GreenS>;
	private var blueG:FlxTypedGroup<BlueS>;
	private var bullet:Bullets;
	private var expbar:FlxBar;
	private var boss:Boss;
	private var trail:FlxTrail;
	private var pause:Pause;
	private var score:FlxText;
	private var score1:Int;
	private var esc4pause:FlxText;
	
	override public function create():Void
	{
		super.create();
		
		redG = new FlxTypedGroup<RedS>();
		blueG = new FlxTypedGroup<BlueS>();
		greenG = new FlxTypedGroup<GreenS>();
		purpleG = new FlxTypedGroup<PurpleS>();		
		bullet = new Bullets();
		score = new FlxText(camera.x, camera.y);
		esc4pause = new FlxText(camera.x + 120, camera.y, 0, "Press ESC for pause", 16);
		score1 = 0;
		
		
		levelSetup();
		add(tilemap);
		cameraSetup();
		add(bullet);
		bullet.kill();
		add(player);
		add(boss);
		add(redG);
		add(blueG);
		add(greenG);
		add(purpleG);
		add(score);
		score.scrollFactor.set(0, 0);
		add(esc4pause);
		esc4pause.scrollFactor.set(0, 0);
		
		expbar = new FlxBar(player.x - 5, player.y - 5, LEFT_TO_RIGHT, 50, 5, player, "", 0, 100);
		expbar.createFilledBar(FlxColor.BLACK, FlxColor.GREEN);
		
		expbar.value = player.exp;
		add(expbar);
		
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		
		score.text = "Score: " + score1;
		score.size = 16;
		
		
		if (score1 == 40)
			FlxG.switchState(new Win());
		
		if (FlxG.keys.justPressed.ESCAPE)
			pause1();
		
		expbar.trackParent(0,-10);
		expbar.value = player.exp;
		expbar.updateBar();
		
		if (FlxG.keys.justPressed.R){
			FlxG.resetState();
		}
		
		collisionCheck();		
		
		purpleG.forEachAlive(checkEnemyVisionP);
		blueG.forEachAlive(checkEnemyVisionB);
		greenG.forEachAlive(checkEnemyVisionG);

		if (FlxG.mouse.justPressed)
		{
			bullet.reset(Reg.PlayerPosX, Reg.PlayerPosY);
			bullet.angle = FlxAngle.angleBetweenMouse(bullet, true);		
			bullet.set_bulletX(Math.cos(bullet.angle * FlxAngle.TO_RAD) * 500);
			bullet.set_bulletY(Math.sin(bullet.angle * FlxAngle.TO_RAD) * 500);
			
		}
		if (player.exp == 100){			
			trail = new FlxTrail(player, null, 5, 4, 0.4, 0.10);
			add(trail);
			
		}
				
	}	
	
	function pause1(){
		pause = new Pause();
        openSubState(pause);
	}
	
	function collisionCheck() 
	{
		FlxG.collide(player, tilemap);
		if(bullet.alive == true && FlxG.collide(bullet, tilemap)){
			bullet.kill();
		}
		
		FlxG.collide(purpleG, redG);
		FlxG.collide(purpleG, blueG);
		FlxG.collide(purpleG, greenG);
		FlxG.collide(purpleG, purpleG);
		FlxG.collide(purpleG, tilemap);
		
		FlxG.collide(redG, greenG);
		FlxG.collide(redG, blueG);
		FlxG.collide(redG, redG);
		FlxG.collide(redG, tilemap);
		
		
		FlxG.collide(blueG, greenG);
		FlxG.collide(blueG, blueG);
		FlxG.collide(blueG, tilemap);		
		
		FlxG.collide(greenG, greenG);
		FlxG.collide(greenG, greenG);
		
		FlxG.overlap(bullet, redG, bulletRed);
		FlxG.overlap(bullet, purpleG, bulletPurple);
		FlxG.overlap(bullet, blueG, bulletBlue);
		FlxG.overlap(bullet, greenG, bulletGreen);
		FlxG.overlap(bullet, boss, bulletBoss);
		FlxG.overlap(player, redG, playerRed);
		FlxG.overlap(player, purpleG, playerPurple);
		FlxG.overlap(player, blueG, playerBlue);
		FlxG.overlap(player, greenG, playerGreen);
		FlxG.overlap(player, boss, playerBoss);
	}
	
	function checkEnemyVisionP(e:PurpleS):Void
	{
		if (tilemap.ray(e.getMidpoint(), player.getMidpoint()))
		{
			e.seesPlayer = true;
			e.playerPos.copyFrom(player.getMidpoint());
		}
		else
			e.seesPlayer = false;
	}
	function checkEnemyVisionB(e:BlueS):Void
	{
		if (tilemap.ray(e.getMidpoint(), player.getMidpoint()))
		{
			e.seesPlayer = true;
			e.playerPos.copyFrom(player.getMidpoint());
		}
		else
			e.seesPlayer = false;
	}
	function checkEnemyVisionG(e:GreenS):Void
	{
		if (tilemap.ray(e.getMidpoint(), player.getMidpoint()))
		{
			e.seesPlayer = true;
			e.playerPos.copyFrom(player.getMidpoint());
		}
		else
			e.seesPlayer = false;
	}

	function playerBoss(a:Player,b:FlxSprite)
	{
		FlxG.switchState(new Defeat());
	}

	function playerGreen(a:Player,b:FlxSprite)
	{
		FlxG.switchState(new Defeat());
	}

	function playerBlue(a:Player,b:FlxSprite)
	{
		FlxG.switchState(new Defeat());
	}

	function playerPurple(a:Player,b:FlxSprite)
	{
		FlxG.switchState(new Defeat());
	}

	function playerRed(a:Player,b:FlxSprite)
	{
		FlxG.switchState(new Defeat());
	}

	function bulletBoss(a:Bullets,b:FlxSprite)
	{
		player.exp += 5;
		a.kill();
		b.kill();
		
	}

	function bulletGreen(a:Bullets,b:FlxSprite)
	{
		player.exp += 5;
		score1 += 1;
		a.kill();
		b.kill();
		
	}

	function bulletBlue(a:Bullets,b:FlxSprite)
	{
		player.exp += 5;
		score1 += 1;
		a.kill();
		b.kill();
		
	}

	function bulletPurple(a:Bullets,b:FlxSprite)
	{
		player.exp += 7;
		score1 += 1;
		a.kill();
		b.kill();
		
	}

	function bulletRed(a:Bullets,b:FlxSprite)
	{
		player.exp += 2;
		score1 += 1;
		a.kill();
		b.kill();
		
	}

	function levelSetup()
	{
		loader = new FlxOgmoLoader(AssetPaths.lvl1__oel);

		tilemap = loader.loadTilemap(AssetPaths.tilemap__png,32,32,"tilemap");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.NONE);
		tilemap.setTileProperties(3, FlxObject.NONE);

		loader.loadEntities(entityCreator, "entities");

	}

	function cameraSetup()
	{
		FlxG.camera.follow(player);
	}

	private function entityCreator(entityName:String, entityData:Xml)
	{

		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));

		switch (entityName)
		{
			case "player":
				player = new Player(x, y);
			case "e1":
				var e1 = new RedS(x, y);
				redG.add(e1);
			case "e2":
				var e2 = new BlueS(x, y);
				blueG.add(e2);
			case "e3":
				var e3 = new GreenS(x, y);
				greenG.add(e3);
			case "e4":
				var e4 = new PurpleS(x, y);
				purpleG.add(e4);
			case "boss":
				boss = new Boss(x, y);
			

		}
	}
}
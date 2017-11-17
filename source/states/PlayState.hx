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

class PlayState extends FlxState
{
	private var player:Player;
	private var loader:FlxOgmoLoader;	
	private var tilemap:FlxTilemap;	
	private var groupGorro:FlxTypedGroup<Enemy>;
	private var exp:FlxBar;
	
	override public function create():Void
	{
		super.create();
		levelSetup();
		add(tilemap);
		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	function levelSetup()
	{
		loader = new FlxOgmoLoader(AssetPaths.lvl1__oel);
		
		tilemap = loader.loadTilemap(AssetPaths.tilemap__png,32,32,"tilemap");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.NONE);		
		
		//loader.loadEntities(entityCreator, "entities");
		
	}
}
package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/lvl1.oel", "assets/data/lvl1.oel");
			type.set ("assets/data/lvl1.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/lvl1.oep", "assets/data/lvl1.oep");
			type.set ("assets/data/lvl1.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/blueSlime.png", "assets/images/blueSlime.png");
			type.set ("assets/images/blueSlime.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/boss.png", "assets/images/boss.png");
			type.set ("assets/images/boss.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/character1.png", "assets/images/character1.png");
			type.set ("assets/images/character1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/greenSlime.png", "assets/images/greenSlime.png");
			type.set ("assets/images/greenSlime.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/gun.png", "assets/images/gun.png");
			type.set ("assets/images/gun.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player.png", "assets/images/player.png");
			type.set ("assets/images/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/purpleSlime.png", "assets/images/purpleSlime.png");
			type.set ("assets/images/purpleSlime.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/redSlime.png", "assets/images/redSlime.png");
			type.set ("assets/images/redSlime.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/square.png", "assets/images/square.png");
			type.set ("assets/images/square.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tilemap.png", "assets/images/tilemap.png");
			type.set ("assets/images/tilemap.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData

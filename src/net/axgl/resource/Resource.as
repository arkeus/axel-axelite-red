package net.axgl.resource {
	/**
	 * All the assets used in our game.
	 */
	public class Resource {
		[Embed(source = "/player.png")] public static const PLAYER:Class;
		[Embed(source = "/spike.png")] public static const SPIKE:Class;
		[Embed(source = "/star.png")] public static const STAR:Class;
		[Embed(source = "/coin.png")] public static const COIN:Class;
		[Embed(source = "/launcher.png")] public static const LAUNCHER:Class;
		[Embed(source = "/coin_particle.png")] public static const COIN_PARTICLE:Class;
		[Embed(source = "/damage_particle.png")] public static const DAMAGE_PARTICLE:Class;
		[Embed(source = "/launcher_particle.png")] public static const LAUNCHER_PARTICLE:Class;
		[Embed(source = "/tiles.png")] public static const TILESET:Class;
		[Embed(source = "/grid.png")] public static const GRID:Class;
		[Embed(source = "/title.png")] public static const TITLE:Class;
		
		// Our level, in CSV format.
		public static const LEVEL_DATA:String = "1,2,2,2,2,13,6,14,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3\n" +
		"5,0,0,0,0,7,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7\n" +
		"5,0,0,0,0,19,2,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7\n" +
		"5,0,0,0,0,0,0,0,0,0,0,0,15,10,10,10,10,10,10,10,10,16,0,0,15,10,10,10,10,17\n" +
		"5,0,0,0,0,0,0,0,0,0,0,0,7,6,6,6,6,6,6,6,6,5,0,0,7,6,6,6,6,6\n" +
		"5,0,0,0,0,0,0,0,0,0,0,15,17,6,14,2,2,2,2,2,2,20,0,0,19,2,2,2,2,13\n" +
		"5,0,0,0,0,15,10,16,0,0,15,17,6,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7\n" +
		"5,0,0,0,0,7,6,5,0,15,17,6,6,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7\n" +
		"18,10,10,10,10,17,6,18,10,17,6,6,6,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7\n" +
		"6,6,6,6,6,6,6,6,6,6,6,6,6,6,18,10,16,0,0,0,15,10,10,10,10,16,0,0,0,7\n" +
		"6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,5,0,0,0,7,6,6,6,6,5,0,0,0,7\n" +
		"6,6,6,6,6,14,2,2,2,2,2,2,2,2,2,2,20,0,0,0,19,2,2,2,2,20,0,0,0,7\n" +
		"6,6,6,6,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7\n" +
		"14,2,2,2,2,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7\n" +
		"5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7\n" +
		"5,0,0,0,0,0,0,0,0,0,0,0,15,16,0,0,15,16,0,0,15,16,0,0,0,15,10,10,10,17\n" +
		"5,0,0,0,0,0,0,0,15,16,0,0,19,20,0,0,19,20,0,0,7,5,0,0,0,7,6,6,6,6\n" +
		"5,0,0,0,0,0,0,0,7,5,0,0,0,0,0,0,0,0,0,0,7,18,10,10,10,17,6,6,6,6\n" +
		"5,0,0,0,15,16,0,0,7,18,16,0,0,0,0,0,0,0,0,0,7,6,6,6,6,6,6,6,6,6\n" +
		"9,10,10,10,17,18,10,10,17,6,18,10,10,10,10,10,10,10,10,10,17,6,6,6,6,6,6,6,6,6";
	}
}

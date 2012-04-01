package net.axgl.state {
	import net.axgl.entity.Coin;
	import net.axgl.entity.Enemy;
	import net.axgl.entity.Entity;
	import net.axgl.entity.Launcher;
	import net.axgl.entity.Player;
	import net.axgl.entity.Spike;
	import net.axgl.entity.Star;
	import net.axgl.resource.Resource;
	import net.axgl.util.World;
	
	import org.axgl.Ax;
	import org.axgl.AxEntity;
	import org.axgl.AxGroup;
	import org.axgl.AxRect;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.collision.AxCollisionGroup;
	import org.axgl.collision.AxGrid;
	import org.axgl.input.AxKey;
	import org.axgl.particle.AxParticleEffect;
	import org.axgl.particle.AxParticleSystem;
	import org.axgl.render.AxBlendMode;
	import org.axgl.render.AxColor;
	import org.axgl.tilemap.AxTile;
	import org.axgl.tilemap.AxTilemap;
	import org.axgl.util.AxRange;

	/**
	 * Our main game state where all the actual logic lies.
	 */
	public class GameState extends AxState {
		/**
		 * The AxGrid we'll use for colliding. By creating this here, and reusing it, we have more efficient collision.
		 */
		public static const OBJECT_COLLISION:AxCollisionGroup = new AxGrid(World.WIDTH, World.HEIGHT);
		
		/**
		 * Our player objeect.
		 */
		public var player:Player;
		/**
		 * Our world tilemap.
		 */
		public var tilemap:AxTilemap;
		/**
		 * All game entities. 
		 */
		public var entities:AxGroup;
		/**
		 * All enemies. 
		 */
		public var enemies:AxGroup;
		/**
		 * All coins. 
		 */
		public var coins:AxGroup;
		/**
		 * All launchers. 
		 */
		public var launchers:AxGroup;
		/**
		 * All particles. 
		 */
		public var particles:AxGroup;
		/**
		 * The background sprite. 
		 */
		public var background:AxSprite;
		
		
		/**
		 * Create our game state.
		 */
		override public function create():void {
			Ax.background = new AxColor(189/255, 189/255, 189/255);
			initializeParticleEffects();
			
			// Make our background grid that won't scroll with the camera
			background = new AxSprite(0, 0, Resource.GRID);
			background.scroll.x = background.scroll.y = 0;
			this.add(background);
			
			// Load our tilemap
			tilemap = new AxTilemap().build(Resource.LEVEL_DATA, Resource.TILESET, 24, 24);
			this.add(tilemap);
			
			// Create our player
			player = new Player(36, 428);
			this.add(player);
			
			// Set the camera to follow our player, but only in the bounds of the world
			Ax.camera.follow(player);
			Ax.camera.bounds = new AxRect(0, 0, World.WIDTH, World.HEIGHT);
			
			// Add all our game objects to the level
			addObjects();
		}
		
		override public function update():void {
			// Make the background grid fade in and out base on the current time (Ax.now)
			background.alpha = (1 + Math.sin(Ax.now / 500)) / 10 + 0.1;
			
			// If we hit escape, pop back to the title state
			if (Ax.keys.pressed(AxKey.ESCAPE)) {
				Ax.popState();
			}
			
			super.update();
			
			// Collide all the entities with the tilemap
			Ax.collide(entities, tilemap);
			// Overlap the player with the entities, calling onHitObject if anything does collide
			Ax.overlap(player, entities, onHitObject, OBJECT_COLLISION);
		}
		
		/**
		 * The locations of all the coins. Typically you'd use a map editor or some external tool to build your world. For simplicity,
		 * we're just hard coding the locations of the coins.
		 */
		private static const COIN_LOCATIONS:Array = [
			[4, 16], [5, 16], [8, 14], [9, 14], [12, 13], [13, 13], [16, 13], [17, 13], [27, 8], [27, 9], [27, 10], [27, 11], [27, 12],
			[20, 7], [21, 7], [22, 7], [23, 7], [24, 7], [25, 7], [26, 1], [27, 1], [28, 1], [26, 2], [27, 2], [28, 2], [2, 3],
			[2, 4], [2, 5], [3, 3], [3, 4], [3, 5]
		];
		
		/**
		 * All all the objects in the world. Typically you'd use a map editor or some external tool to build your world. For simplicity,
		 * we're just hard coding the locations of the objects.
		 */
		private function addObjects():void {
			enemies = new AxGroup;
			enemies.add(new Spike(6, 18));
			enemies.add(new Spike(7, 18));
			enemies.add(new Spike(22, 16));
			enemies.add(new Spike(23, 16));
			enemies.add(new Spike(24, 16));
			enemies.add(new Star(14, 13, Star.VERTICAL));
			enemies.add(new Star(15, 17, Star.VERTICAL));
			enemies.add(new Star(6, 4, Star.VERTICAL));
			enemies.add(new Star(22, 8, Star.HORIZONTAL));
			this.add(enemies);
			
			coins = new AxGroup;
			for each(var coinLocation:Array in COIN_LOCATIONS) {
				coins.add(new Coin(coinLocation[0], coinLocation[1]));
			}
			this.add(coins);
			
			launchers = new AxGroup;
			launchers.add(new Launcher(3, 18));
			launchers.add(new Launcher(22, 8));
			launchers.add(new Launcher(23, 8));
			launchers.add(new Launcher(27, 14));
			this.add(launchers);
			
			entities = new AxGroup;
			entities.add(player);
			entities.add(enemies);
			entities.add(coins);
			entities.add(launchers);
		}
		
		/**
		 * This is called whenever the player collides with an entity. Here, we check what type the entity is, and
		 * handle the logic differently for each.
		 */
		private function onHitObject(player:Player, object:Entity):void {
			if (object is Enemy) {
				if (player.hurt) {
					return;
				}
				
				player.hit(object);
			} else if (object is Coin) {
				AxParticleSystem.emit("coin-shatter", object.x, object.y);
				object.destroy();
			} else if (object is Launcher) {
				AxParticleSystem.emit("launcher", object.x, object.y);
				player.velocity.y = -450;
			}
		}
		
		/**
		 * Initializes the particle effects we will use in the game.
		 */
		private function initializeParticleEffects():void {
			this.add(particles = new AxGroup);
			
			var coinShatter:AxParticleEffect = new AxParticleEffect("coin-shatter", Resource.COIN_PARTICLE, 15);
			coinShatter.x = new AxRange(5, 14);
			coinShatter.y = new AxRange(5, 14);
			coinShatter.xVelocity = new AxRange(-30, 30);
			coinShatter.yVelocity = new AxRange(-30, 30);
			coinShatter.lifetime = new AxRange(0.5, 2);
			coinShatter.amount = 100;
			coinShatter.blend = AxBlendMode.PARTICLE;
			coinShatter.color(new AxColor(0.1, 0, 0), new AxColor(1, 0.2, 0.2), new AxColor(0.1, 0, 0), new AxColor(1, 0.2, 0.2));
			particles.add(AxParticleSystem.register(coinShatter));
			
			var damage:AxParticleEffect = new AxParticleEffect("damage", Resource.DAMAGE_PARTICLE, 2);
			damage.xVelocity = new AxRange(-50, 50);
			damage.yVelocity = new AxRange(-120, -60);
			damage.yAcceleration = new AxRange(200, 500);
			damage.lifetime = new AxRange(0.5, 3);
			damage.amount = 50;
			damage.blend = AxBlendMode.BLEND;
			damage.color(new AxColor(0.1, 0, 0), new AxColor(1, 0.2, 0.2), new AxColor(0.1, 0, 0), new AxColor(1, 0.2, 0.2));
			particles.add(AxParticleSystem.register(damage));
			
			var launcher:AxParticleEffect = new AxParticleEffect("launcher", Resource.LAUNCHER_PARTICLE, 4);
			launcher.x = new AxRange(0, 24);
			launcher.y = new AxRange(0, 6);
			launcher.xVelocity = new AxRange(-50, 50);
			launcher.yVelocity = new AxRange(-30, 0);
			launcher.yAcceleration = new AxRange(-500, -200);
			launcher.lifetime = new AxRange(0.5, 3);
			launcher.amount = 50;
			launcher.blend = AxBlendMode.PARTICLE;
			launcher.color(new AxColor(0, 0, 0), new AxColor(1, 1, 1), new AxColor(0, 0, 0), new AxColor(1, 1, 1));
			particles.add(AxParticleSystem.register(launcher));
		}
	}
}

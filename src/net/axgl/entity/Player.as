package net.axgl.entity {
	import net.axgl.resource.Resource;
	
	import org.axgl.Ax;
	import org.axgl.AxSprite;
	import org.axgl.AxVector;
	import org.axgl.input.AxKey;
	import org.axgl.particle.AxParticleSystem;

	/**
	 * Our player entity that we control in the world.
	 */
	public class Player extends AxSprite {
		/**
		 * A timer keeping track of whether (and how long) the player is hurt.
		 */
		public var hurtTimer:Number = 0;
		
		/**
		 * Creates a new player.
		 */
		public function Player(x:uint, y:uint) {
			super(x, y, Resource.PLAYER);
			
			// Add friction
			drag = new AxVector(400, 300);
			// Add the maximum velocity of our player
			terminal = new AxVector(150, 600);
			// Add gravity
			acceleration.y = 600;
		}
		
		override public function update():void {
			// If we press UP or W, and we're touching the ground, jump!
			if ((Ax.keys.pressed(AxKey.UP) || Ax.keys.down(AxKey.W)) && isTouching(DOWN)) {
				velocity.y = -260;
			}
			
			// Move left and right using an acceleration of 500
			if (Ax.keys.down(AxKey.RIGHT) || Ax.keys.down(AxKey.D)) {
				acceleration.x = 500;
				facing = RIGHT;
			} else if (Ax.keys.down(AxKey.LEFT) || Ax.keys.down(AxKey.A)) {
				acceleration.x = -500;
				facing = LEFT;
			} else {
				acceleration.x = 0;
			}
			
			// If we're hurt, change our color to a dark red until hurtTimer has run out
			if (hurt) {
				hurtTimer -= Ax.dt;
				color(1, 0.3, 0.3, 0.6);
			} else {
				color(1, 1, 1, 1);
			}
		}
		
		/**
		 * This is called when we collide with an enemy.
		 */
		public function hit(enemy:Entity):void {
			// Set our hurt timer
			hurtTimer = 2;
			
			// Push us sideways based on which side of the enemy we were on
			if (enemy.center.x > center.x) {
				velocity.x = -200;
			} else {
				velocity.x = 200;
			}
			
			// Push us up a bit to make us bounce
			velocity.y = -100;
			
			// Emit the damage particle effect at our current location
			AxParticleSystem.emit("damage", center.x, center.y);
		}
		
		/**
		 * Returns whether or not we are hurt, by checking if hurtTimer > 0
		 */
		public function get hurt():Boolean {
			return hurtTimer > 0;
		}
	}
}

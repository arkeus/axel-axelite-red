package net.axgl.entity {
	import net.axgl.resource.Resource;
	import net.axgl.util.World;
	
	import org.axgl.AxSprite;

	/**
	 * Our animated coin entity that we can collect.
	 */
	public class Coin extends Entity {
		/**
		 * Create a coin at the specified location.
		 */
		public function Coin(x:uint, y:uint) {
			// Call Entity's constructor
			super(x, y);
			// Load the Resource.COIN graphic, each frame is 19x19
			load(Resource.COIN, 19, 19);
			// Add the wiggle animation
			addAnimation("wiggle", [0, 0, 1, 1, 2, 3, 4, 4, 3, 2, 1, 1], 15, true);
			// Play the wiggle animation repeatedly (looped was set to true)
			animate("wiggle");
		}
	}
}

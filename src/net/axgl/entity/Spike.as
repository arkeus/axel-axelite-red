package net.axgl.entity {
	import net.axgl.resource.Resource;
	import net.axgl.util.World;
	
	import org.axgl.AxSprite;

	/**
	 * Our static spike enemy that sits on the ground that you can't step on.
	 */
	public class Spike extends Enemy {
		/**
		 * Creates a new spike
		 */
		public function Spike(x:uint, y:uint) {
			super(x, y, 0, 17);
			// Load the spike, since it's only 1 frame, no need to pass frame size
			load(Resource.SPIKE);
		}
	}
}

package net.axgl.entity {
	import net.axgl.resource.Resource;
	import net.axgl.util.World;

	import org.axgl.AxSprite;

	/**
	 * These are the bouncing spikes that you must avoid.
	 */
	public class Star extends Enemy {
		/** These are the possible choices for orientation, which determines which way it bounces */
		public static const HORIZONTAL:uint = 0;
		public static const VERTICAL:uint = 1;
		/** The speed at which it moves */
		public static const SPEED:uint = 100;

		/**
		 * Which way this specific instance should bounce.
		 */
		private var orientation:uint;

		/**
		 * Creates a new bouncing star, bouncing in the direction specified in orientation.
		 */
		public function Star(x:uint, y:uint, orientation:uint) {
			super(x, y);
			// Load our star image, since it's a single frame, no need to pass frame size
			load(Resource.STAR);

			// Set the bouncing direction based on what was passed
			this.orientation = orientation;

			// Set the correct axis of velocity based on the bouncing axis
			if (orientation == HORIZONTAL) {
				velocity.x = SPEED;
			} else {
				velocity.y = SPEED;
			}
		}

		override public function update():void {
			// Here we reverse our direction if we hit a wall, so that we bounce indefinitely
			if (isTouching(DOWN)) {
				velocity.y = -SPEED;
			} else if (isTouching(UP)) {
				velocity.y = SPEED;
			} else if (isTouching(LEFT)) {
				velocity.x = SPEED;
			} else if (isTouching(RIGHT)) {
				velocity.x = -SPEED;
			}
		}
	}
}

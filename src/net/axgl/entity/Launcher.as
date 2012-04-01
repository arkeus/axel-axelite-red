package net.axgl.entity {
	import net.axgl.resource.Resource;

	/**
	 * The launcher sprite which launches the player up into the air.
	 */
	public class Launcher extends Entity {
		/**
		 * Creates a new launcher.
		 */
		public function Launcher(x:uint, y:uint) {
			super(x, y, 0, 18);
			// Load the launcher sprite, because it's only 1 frame, no need to specify frame size
			load(Resource.LAUNCHER);
		}
	}
}
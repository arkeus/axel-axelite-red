package net.axgl.entity {

	/**
	 * A base class for our enemies.
	 */
	public class Enemy extends Entity {
		/**
		 * Create a new enemy at the specified position with the specified offset.
		 */
		public function Enemy(x:uint, y:uint, offsetx:uint = 0, offsety:uint = 0) {
			super(x, y, offsetx, offsety);
		}
	}
}

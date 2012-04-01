package net.axgl.entity {
	import net.axgl.util.World;
	
	import org.axgl.AxSprite;

	/**
	 * Our entity class, representing any of the game entities in the world.
	 */
	public class Entity extends AxSprite {
		/**
		 * Create an entity at the specified tile position, with the specified offset. This let's us easily
		 * specify the starting location of the sprite in tile coordinates (5, 5) rather than knowing the
		 * exact pixel value. The offset allows us to shift it because our entities aren't the same size as
		 * our tiles.
		 */
		public function Entity(tilex:uint, tiley:uint, offsetx:uint = 0, offsety:uint = 0) {
			super(tilex * World.TILE_SIZE + offsetx, tiley * World.TILE_SIZE + offsety);
		}
	}
}

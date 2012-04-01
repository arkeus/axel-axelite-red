package {
	import net.axgl.state.GameState;
	import net.axgl.state.TitleState;
	
	import org.axgl.Ax;
	
	[SWF(width = "600", height = "384", backgroundColor = "#333333")]
	
	public class AxeliteRed extends Ax {
		public function AxeliteRed() {
			// Start in our TitleState with a zoom of 1
			super(600, 383, new TitleState, 1);
			// Force ability to open debugger using ~ or \ even in release mode
			Ax.debuggerEnabled = true;
		}
	}
}
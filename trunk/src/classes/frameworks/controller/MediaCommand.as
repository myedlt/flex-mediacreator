package classes.frameworks.controller 
{
	import classes.core.DesignCanvas;
	import classes.core.History;
	import classes.frameworks.view.DesignCanvasMediator;
	import classes.frameworks.view.LayersManagerMdeiator;
	import classes.transform.TransformTool;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommandWithUndo;
	
	import ui.window.layer.LayersManager;

	/**
	 * @author Halley
	 */
	public class MediaCommand extends SimpleCommandWithUndo 
	{
		protected var designCanvas:DesignCanvas = DesignCanvasMediator.designCanvas;
		protected var layersManager:LayersManager = LayersManagerMdeiator.layersManager;
		protected var transformTool:TransformTool = designCanvas.transformTool;
		override public function execute( note : INotification ) : void 
		{
			doHistory(note.getBody(),false);
		}
		
		override public function undo( note : INotification) : void 
		{
			doHistory(note.getBody(),true);
		}
		private function doHistory(obj:*,isUndo:Boolean):void
		{
			if(obj is History)
			{
				var history:History = History(obj);
				if(isUndo)
					history.callBack(history.oldItem);
				else
					history.callBack(history.newItem);
			}
		}
	}
}

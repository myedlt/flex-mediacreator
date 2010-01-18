package classes.frameworks.controller.designcanvas 
{
	import classes.core.IMediaObject;
	import classes.frameworks.controller.MediaCommand;
	import classes.transform.TransformToolEvent;
	
	import org.puremvc.as3.interfaces.INotification;		

	/**
	 * @author Halley
	 */
	public class MatrixChangeCommand extends MediaCommand 
	{
		override public function execute( note : INotification) : void 
		{
			var event : TransformToolEvent = TransformToolEvent( note.getBody( ) );
			var mo : IMediaObject = designCanvas.getItemByUid( event.uid );
			mo.transform.matrix = event.newMatrix ;
			transformTool.updateMatrixAndView( event.newMatrix );
			if(isDone)	designCanvas.setSelection( mo, false, false );
			else		isDone = true;
			//designCanvas.selectedItem = mo;
		}

		override public function undo( note : INotification) : void 
		{
			var event : TransformToolEvent = TransformToolEvent( note.getBody( ) );
			var mo : IMediaObject = designCanvas.getItemByUid( event.uid );
			mo.transform.matrix = event.oldMatrix ;
			transformTool.updateMatrixAndView( event.oldMatrix );
			designCanvas.setSelection( mo, false, false );
		}
	}
}

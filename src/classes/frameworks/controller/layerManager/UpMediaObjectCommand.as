package classes.frameworks.controller.layerManager
{
	import classes.core.MediaLink;
	import classes.frameworks.controller.MediaCommand;
	import classes.frameworks.view.LayersManagerMdeiator;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class UpMediaObjectCommand extends MediaCommand
	{
		override public function execute( note : INotification) : void 
		{
			var layersManagerMdeiator:LayersManagerMdeiator = LayersManagerMdeiator(facade.retrieveMediator(LayersManagerMdeiator.NAME));
			layersManagerMdeiator.switchItemDepth( "up", designCanvas.getItemByUid( MediaLink( note.getBody( ) ).uid ) );
		}
		
		override public function undo( note : INotification) : void 
		{
			var layersManagerMdeiator:LayersManagerMdeiator = LayersManagerMdeiator(facade.retrieveMediator(LayersManagerMdeiator.NAME));
			layersManagerMdeiator.switchItemDepth( "down", designCanvas.getItemByUid( MediaLink( note.getBody( ) ).uid ) );
		}
	}
}
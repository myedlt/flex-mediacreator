package classes.frameworks.controller.layerManager 
{
	import classes.core.ItemFactory;
	import classes.core.MediaLink;
	import classes.frameworks.controller.MediaCommand;
	import classes.utils.CacheUtil;
	
	import org.puremvc.as3.interfaces.INotification;

	/**
	 * @author Halley
	 */
	public class RemoveMediaObjectCommand extends MediaCommand 
	{
		override public function execute( note : INotification) : void 
		{
			var link:MediaLink = MediaLink( note.getBody( ) );
			designCanvas.removeMediaItemByUID( link.uid );
			delete CacheUtil.allCacheMediaLinks[ link.uid ];
		}

		override public function undo( note : INotification) : void 
		{
			designCanvas.addMediaItem(ItemFactory.creatMediaObject( MediaLink( note.getBody( ) ) ) );
		}
	}
}

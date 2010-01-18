package classes.frameworks.controller.layerManager
{
	import classes.core.IMediaObject;
	import classes.core.ItemFactory;
	import classes.core.MediaLink;
	import classes.frameworks.controller.MediaCommand;
	import classes.utils.CacheUtil;
	
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * @author Halley
	 */
	public class RemoveAllMediaObjectCommand extends MediaCommand 
	{
		override public function execute( note : INotification) : void 
		{
			CacheUtil.removedMediaObjectLinks = designCanvas.removeAllMediaItem();
		}
		
		override public function undo( note : INotification) : void 
		{
			var newItems:Vector.<IMediaObject> = new Vector.<IMediaObject>();
			for each(var link:MediaLink in CacheUtil.removedMediaObjectLinks)
			{
				newItems.push(ItemFactory.creatMediaObject(link));
			}
			designCanvas.addMediaItems( newItems );
		}
	}
}
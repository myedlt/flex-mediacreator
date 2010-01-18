package classes.frameworks.controller.designcanvas
{
	import classes.core.IMediaObject;
	import classes.core.IRelatedObject;
	import classes.core.ItemFactory;
	import classes.core.MediaLink;
	import classes.core.MediaMask;
	import classes.frameworks.controller.MediaCommand;
	import classes.utils.CacheUtil;
	
	import flash.display.DisplayObject;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class AddMaskCommand extends MediaCommand
	{
		override public function execute( note : INotification ) : void 
		{
			var link:MediaLink = MediaLink( note.getBody( ) );
			var maskObj:MediaMask = MediaMask( ItemFactory.creatMediaObject( link ) );
			var maskedItem:IMediaObject = designCanvas.getItemByUid( link.maskedItemUid );
			IRelatedObject( maskObj.relatedObject ).relatedObject.width = maskedItem.relatedObject.width;
			IRelatedObject( maskObj.relatedObject ).relatedObject.height = maskedItem.relatedObject.height;
			
			maskedItem.relatedObject.mask = maskedItem.addChild( DisplayObject( maskObj ) );
			maskObj.x = 0;
			maskObj.y = 0;
			maskedItem.maskObject = maskObj;
		}
		
		override public function undo( note : INotification) : void 
		{
			var link:MediaLink = MediaLink( note.getBody( ) );
			var maskedItem:IMediaObject = designCanvas.getItemByUid( link.maskedItemUid );
			maskedItem.removeMask();
			delete CacheUtil.allCacheMediaLinks[ link.uid ];
		}
	}
}
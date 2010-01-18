package classes.mediaItem
{
	import classes.core.IRelatedObject;
	import classes.core.IMediaObject;
	import classes.core.MediaObject;

	import mx.controls.Button;

	public class MediaButton extends MediaObject implements IMediaObject,IRelatedObject
	{

		public function MediaButton()
		{
			super( );
			
			var button : Button = new Button( );
			this.measuredWidth = button.width = 40;
			this.measuredHeight = button.height = 20;
			
			relatedObject = button;
			addChild( button );
		}
	}
}
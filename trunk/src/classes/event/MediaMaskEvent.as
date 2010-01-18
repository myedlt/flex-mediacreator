package classes.event
{
	import classes.core.MediaLink;
	import classes.core.MediaMask;

	/**
	 * 
	 * 遮罩的事件
	 * 
	 */	
	public class MediaMaskEvent extends MediaItemEvent
	{
		public static const MASKING : String = "onMasking";
		public static const MASKED : String = "onMasked";

		public function MediaMaskEvent(type : String, link:MediaLink)
		{
			super( type,link );
		}
	}
}
package classes.core
{
	import classes.mxml.IMXML;
	
	/**
	 * 所有媒体集合的基类
	 * @author Administrator
	 * 
	 */
	public class MediaObjectContainer extends MediaObject implements IMXML,IMediaObjectContainer
	{
		public function MediaObjectContainer()
		{
			super();
		}
	}
}
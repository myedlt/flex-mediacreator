package classes.utils 
{
	import flash.display.IBitmapDrawable;
	import flash.net.FileReference;
	
	import mx.graphics.ImageSnapshot;
	import mx.graphics.codec.JPEGEncoder;	

	/**
	 * @author Halley
	 */
	public class FileCreateor 
	{
		private static var fileReference : FileReference = new FileReference( );
		private static const jpegEnc : JPEGEncoder = new JPEGEncoder( );  

		public static function createImage(image : IBitmapDrawable) : void
		{
			fileReference.save( ImageSnapshot.captureImage( image, 0, jpegEnc ).data, "未命名.jpg" );
		}
	}
}

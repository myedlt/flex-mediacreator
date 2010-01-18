package classes.mediaItem
{
	import classes.core.MediaObject;
	
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	public class MediaText extends MediaObject
	{
		private var textField:TextField;
		public function MediaText()
		{
			super( );
			
			textField = new TextField();
			textField.border = true;
			textField.type = TextFieldType.INPUT;
			
			this.measuredWidth = textField.width = 40;
			this.measuredHeight = textField.height = 20;
			
			relatedObject = textField;
			addChild( textField );
		}

		public function get text():String
		{
			return textField.text;
		}

		public function set text(value:String):void
		{
			textField.text = value;
		}

	}
}
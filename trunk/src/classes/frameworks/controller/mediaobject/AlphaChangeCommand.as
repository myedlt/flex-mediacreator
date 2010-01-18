package classes.frameworks.controller.mediaobject
{
	import classes.core.History;
	import classes.core.IMediaObject;
	import classes.frameworks.controller.MediaCommand;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class AlphaChangeCommand extends MediaCommand
	{
		override public function execute( note : INotification) : void 
		{
			var history:History = History(note.getBody());
			var item:IMediaObject = designCanvas.getItemByUid( history.uid );
			item.alpha = history.newItem;
			super.execute(note);
		}
		
		override public function undo( note : INotification) : void 
		{
			var history:History = History(note.getBody());
			var item:IMediaObject = designCanvas.getItemByUid( history.uid );
			item.alpha = history.oldItem;
			super.undo(note);
		}
	}
}
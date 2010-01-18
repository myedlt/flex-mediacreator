package classes.frameworks.controller.designcanvas
{
	import classes.core.History;
	import classes.core.ItemFactory;
	import classes.core.MediaLink;
	import classes.frameworks.controller.MediaCommand;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class ChangeBackgroundCommand extends MediaCommand
	{
		override public function execute( note : INotification) : void 
		{
			var history:History = History(note.getBody());
			var newLink:MediaLink = history.newItem;
			designCanvas.chageBackground(ItemFactory.creatMediaObject(newLink));
		}
		
		override public function undo( note : INotification) : void 
		{
			var history:History = History(note.getBody());
			var oldLink:MediaLink = history.oldItem;
			designCanvas.chageBackground(ItemFactory.creatMediaObject(oldLink));
		}
	}
}
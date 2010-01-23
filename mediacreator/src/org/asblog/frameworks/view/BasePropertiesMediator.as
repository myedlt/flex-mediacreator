package org.asblog.frameworks.view
{
	import org.asblog.core.History;
	import org.asblog.core.IMediaObject;
	import org.asblog.frameworks.controller.commandtype.DesignCanvasCT;
	import org.asblog.frameworks.controller.commandtype.MediaObjectCT;
	
	import flash.events.Event;
	
	import mx.controls.ComboBox;
	import mx.controls.HSlider;
	
	import org.puremvc.as3.patterns.mediator.BaseMediator;
	
	import ui.window.properties.BaseProperties;
	
	public class BasePropertiesMediator extends BaseMediator
	{
		public static const NAME : String = "BasePropertiesMediator";
		public static var baseProperties : BaseProperties;
		private var colorStyle:ComboBox;
		private var hslider:mx.controls.HSlider;
		
		public function BasePropertiesMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			baseProperties = BaseProperties(viewComponent);

			colorStyle = baseProperties.colorStyle;
			hslider = baseProperties.hslider;
			
			hslider.addEventListener(Event.CHANGE,onHSliderChange);
			colorStyle.addEventListener(Event.CHANGE,styleChange);
		}
		private function onHSliderChange(event:Event):void
		{
			var selectedItem:IMediaObject = baseProperties.selectedItem;
			var value:int = event.currentTarget.value;
			switch (colorStyle.selectedItem.label)
			{
				case "亮度":
					sendNotification( MediaObjectCT.CMD_COLORSTYLE_BRIGHT, new History( selectedItem.brightness, hslider.value, selectedItem.mediaLink.uid) );
					break;
				case "饱和度":
					sendNotification( MediaObjectCT.CMD_COLORSTYLE_SATURA, new History( selectedItem.saturation, hslider.value, selectedItem.mediaLink.uid) );
					break;
			}
		}
		private function styleChange(event:Event):void
		{
			var selectedItem:IMediaObject = baseProperties.selectedItem;
			switch (colorStyle.selectedItem.label)
			{
				
				case "无":
					if(selectedItem.colorStyleEnable)
						sendNotification( MediaObjectCT.CMD_COLORSTYLE_ENABLE, new History( true, false, selectedItem.mediaLink.uid) );
					break;
				case "亮度":
					hslider.value = selectedItem.brightness;
					selectedItem.cleanStyle();
					break;
				case "饱和度":
					hslider.value = selectedItem.saturation;
					selectedItem.cleanStyle();
					break;
			}
		}
	}
}
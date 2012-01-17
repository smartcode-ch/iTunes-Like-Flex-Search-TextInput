package ch.smartcode.iTunesLikeSearchTextInput.lists
{
	import ch.smartcode.iTunesLikeSearchTextInput.inputs.renderers.SearchTextInputDropDownListItemRenderer;
	import ch.smartcode.iTunesLikeSearchTextInput.inputs.skins.SearchTextInputDropDownListSkin;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import spark.components.DropDownList;
	import spark.events.IndexChangeEvent;
	
	public class SearchTextInputDropDownList extends DropDownList
	{
		
		public static const HIGHLIGHT_DURATION:Number = 750;
		
		private var _selectionChanged:Boolean;

		private var _item:SearchTextInputDropDownListItemRenderer;
		private var _commit:Boolean;
		
		public function SearchTextInputDropDownList()
		{
			super();
			setStyle("skinClass", SearchTextInputDropDownListSkin);
			addEventListener( IndexChangeEvent.CHANGE,itemChangingEventHandler,false,0,true);
			useVirtualLayout = false;
			
			
		}

		private function itemChangingEventHandler(e:IndexChangeEvent):void
		{
			_selectionChanged = true;
		}
				
		override public function closeDropDown(commit:Boolean):void
		{
			if( _selectionChanged ) {
				_item = SearchTextInputDropDownListItemRenderer( dataGroup.getChildAt( selectedIndex ) );
				_item.highlight = true;
				_commit = commit;
				
				var timer:Timer = new Timer( HIGHLIGHT_DURATION,1 );
				timer.addEventListener( TimerEvent.TIMER_COMPLETE, onTimerCompleteHandler,false,0,true);
				timer.start();
				
				_selectionChanged = false;
				
			} else {
				super.closeDropDown( commit );
			}
		}

		private function onTimerCompleteHandler(e:TimerEvent):void
		{
			_item.highlight = false;
			super.closeDropDown( _commit );
		}
	}
}
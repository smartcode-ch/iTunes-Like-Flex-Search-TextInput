package ch.smartcode.iTunesLikeSearchTextInput.inputs
{
	import ch.smartcode.iTunesLikeSearchTextInput.inputs.skins.SearchTextInputSkin;
	import ch.smartcode.iTunesLikeSearchTextInput.lists.SearchTextInputDropDownList;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.events.FlexEvent;
	import mx.events.IndexChangedEvent;
	import mx.events.ItemClickEvent;
	
	import spark.components.Button;
	import spark.components.TextInput;
	import spark.events.IndexChangeEvent;
	import spark.events.TextOperationEvent;
	
	[Event(name="itemClick", type="mx.events.ItemClickEvent")]
	[Event(name="change", type="spark.events.IndexChangeEvent")]
	public class SearchTextInput extends TextInput
	{
		[SkinPart(required="true")]
		[Bindable] public var searchOptions:SearchTextInputDropDownList;
		
		[SkinPart(required="false")]
		public var clearButton:Button;
		private var _indexChanged:Boolean;
		
		[Bindable] 
		public var searchOptionsData:ArrayCollection;
		
		public function SearchTextInput()
		{
			super();
			//setStyle( "focusAlpha", null );
			setStyle( "skinClass", SearchTextInputSkin );
			
			//watch for programmatic changes to text property
			this.addEventListener(FlexEvent.VALUE_COMMIT, textChangedHandler, false, 0, true);
			
			//watch for user changes (aka typing) to text property
			this.addEventListener(TextOperationEvent.CHANGE, textChangedHandler, false, 0, true);
			
		}
		
		protected function textChangedHandler(e:Event):void {
			
			if (clearButton) {
				clearButton.visible = (text.length > 0);
			}
		}
		
		protected function clearClick(e:MouseEvent = null ):void {
			
			text = '';
			
			this.setFocus();
			this.selectRange(0,0);
			
			dispatchEvent( new TextOperationEvent( TextOperationEvent.CHANGE) );
		}
		
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);
			
			if (instance == clearButton) {
				clearButton.addEventListener(MouseEvent.CLICK, clearClick);
				clearButton.visible = (text != null && text.length > 0);
			}
			
			if( instance == searchOptions ) {
				//searchOptions.addEventListener( ItemClickEvent.ITEM_CLICK, optionChangeHandler,false,0,true);
				searchOptions.addEventListener( IndexChangeEvent.CHANGE, optionChangeHandler,false,0,true );
				searchOptions.dataProvider = searchOptionsData;
			}
		}
		
		
		protected function optionChangeHandler(e:IndexChangeEvent):void
		{
			dispatchEvent( e );
		}
		
		override protected function partRemoved(partName:String, instance:Object):void {
			super.partRemoved(partName, instance);
			
			if (instance == clearButton) {
				clearButton.removeEventListener(MouseEvent.CLICK, clearClick);
			}
			
			if( instance == searchOptions ) {
				searchOptions.removeEventListener( IndexChangeEvent.CHANGE, optionChangeHandler );
			}
		}
		
	}
}
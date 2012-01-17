package ch.smartcode.iTunesLikeSearchTextInput.inputs
{
	import ch.smartcode.iTunesLikeSearchTextInput.vo.SearchOptionVO;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.events.FlexEvent;

	public class iTunesLikeSearchTextInput extends SearchTextInput
	{
		
		private var _dataProvider:ArrayCollection;
		private var _filtering:Boolean;
		
		
		public function iTunesLikeSearchTextInput()
		{
			super();
			
			addEventListener( FlexEvent.CREATION_COMPLETE, onCreationCompleteHandler );
		}

		private function onCreationCompleteHandler(e:FlexEvent):void
		{
			searchOptions.labelField = "label";
		}
		
		override protected function textChangedHandler( e:Event ):void {
			super.textChangedHandler( e );
			
			if( text.length > 0 ) {
				filterData();
			} else {
				reset();
			}
			
		}
		
		override protected function clearClick(e:MouseEvent = null ):void {
			super.clearClick( e );
			reset();
		}
		
		public function reset():void
		{
			_dataProvider.filterFunction = null;
			_dataProvider.refresh();
			
			_filtering = false;
			dispatchEvent( new Event( "filteringChange") );
		}
		
		public function filterData():void
		{
			_dataProvider.filterFunction = filterFunction;
			_dataProvider.refresh();
			
			_filtering = true;
			dispatchEvent( new Event( "filteringChange") );
		}
		
		private function filterFunction(item:Object):Boolean
		{
			
			var field:String = SearchOptionVO(searchOptions.selectedItem).field;
			var key:String = this.text;
			
			key = key.toLowerCase();
			var value:String;
			
			if (key != "")
			{
				// a field is selected
				if (field != null) {
					if( item.hasOwnProperty( field ) && (item[ field ] != null) ) {
						
						value = item[ field ].toString().toLowerCase();
						
						if( value.indexOf( key ) != -1 ) {
							return true;
						} else {
							return false;
						}
						
					} 
				// search all data	
				} else {
					for each (var option:SearchOptionVO in searchOptionsData )  {
						
						if( item.hasOwnProperty( option.field ) && (item[ option.field ] != null) ) {
							
							value = item[ option.field ].toString().toLowerCase();
							
							if( value.indexOf( key ) != -1 ) {
								return true;
							}
						} 
					}
					
					return false;
					
				}
			} else {
				return true;
			}
			
			return false;
		}

		public function get dataProvider():ArrayCollection
		{
			return _dataProvider;
		}

		public function set dataProvider(value:ArrayCollection):void
		{
			_dataProvider = value;
		}
		
		[Bindable(event="filteringChange")]
		public function get filtering():Boolean
		{
			return _filtering;
		}


	}
}
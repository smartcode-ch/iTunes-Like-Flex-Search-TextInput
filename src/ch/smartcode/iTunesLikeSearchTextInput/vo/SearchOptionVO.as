package ch.smartcode.iTunesLikeSearchTextInput.vo
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class SearchOptionVO extends EventDispatcher
	{
		
		private var _label:String;
		private var _field:String;
		
		public function SearchOptionVO( field:String, label:String = null ):void
		{
			_field = field;
			_label = label || _field;
			
			dispatchEvent( new Event("dataChange") );
		}
		
		[Bindable(event="dataChange")]
		public function get label():String
		{
			return _label;
		}
		
		[Bindable(event="dataChange")]
		public function get field():String
		{
			return _field;
		}


	}
}
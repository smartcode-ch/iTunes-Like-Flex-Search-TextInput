package ch.smartcode.iTunesLikeSearchTextInput.components
{
	import ch.smartcode.iTunesLikeSearchTextInput.components.skins.CustomTitleWindowSkin;
	import ch.smartcode.iTunesLikeSearchTextInput.inputs.iTunesLikeSearchTextInput;
	
	import spark.components.TitleWindow;
	
	public class CustomTitleWindow extends TitleWindow
	{
		
		[SkinPart(required="true")]
		public var searchInput:iTunesLikeSearchTextInput;
		
		public function CustomTitleWindow()
		{
			super();
			
			setStyle( "skinClass", CustomTitleWindowSkin );
		}
		
	}
}
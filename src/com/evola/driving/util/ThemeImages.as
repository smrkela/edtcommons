package com.evola.driving.util
{
	public class ThemeImages
	{
		
		[Embed(source="/images/categories/1.png")]
		public static var c1 : Class;
		
		[Embed(source="/images/categories/2.png")]
		public static var c2 : Class;
		
		[Embed(source="/images/categories/3.png")]
		public static var c3 : Class;
		
		[Embed(source="/images/categories/4.png")]
		public static var c4 : Class;
		
		[Embed(source="/images/categories/5.png")]
		public static var c5 : Class;
		
		[Embed(source="/images/categories/6.png")]
		public static var c6 : Class;
		
		[Embed(source="/images/categories/7.png")]
		public static var c7 : Class;
		
		private static var _categoryImages : Object = {};
		
		public function ThemeImages()
		{
		}
		
		public static function getCategoryImage(categoryId : String) : Object{
			
			if(!categoryId)
				return null;
			
			if(!_categoryImages.hasOwnProperty(categoryId)){
				
				_categoryImages[categoryId] = new ThemeImages["c"+categoryId]();
			}
			
			return _categoryImages[categoryId];
		}
	}
}
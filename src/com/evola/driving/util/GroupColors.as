package com.evola.driving.util
{

	public class GroupColors
	{

		//private static var _colors:Array=[0x007289, 0x41239B, 0xC23716, 0x007A00, 0x9C092D, 0x093AA2, 0x7C0085];
		private static var _colors:Array=[0x00aba9, 0x603cba, 0xee1111, 0x00a300, 0xb91d47, 0x2d89ef, 0xe3a21a];
		//private static var _colors:Array=[0xE5E5E5, 0xEEEEEE, 0xE5E5E5, 0xEEEEEE,0xE5E5E5, 0xEEEEEE,0xE5E5E5, 0xEEEEEE];

		private static var _inactiveColors:Array=[0x00B0C1, 0x744ECF, 0xEC673E, 0x00B610, 0xCF2E5B, 0x0A6BD4, 0xB710BE];
		//private static var _inactiveColors:Array=[0xDDDDDD, 0xE5E5E5,0xDDDDDD, 0xE5E5E5, 0xDDDDDD, 0xE5E5E5, 0xDDDDDD, 0xE5E5E5];
		
		private static var _activeColors:Array=[0xEF7827, 0xF19027, 0xF5B127, 0xF8C627, 0xFFD654];

		public function GroupColors()
		{
		}
		
		public static function getAlternateColor(isEven : Boolean) : uint{
			
			return isEven ? 0xEEEEEE : 0xFFFFFF;
		}
		
		public static function getHoverAlternateColor(isEven: Boolean):uint{
			
			return isEven ? 0xDDDDDD : 0xE5E5E5;
		}

		public static function getColor(groupId:int):uint
		{
			if (groupId < 1)
				groupId=1;

			return _colors[groupId - 1];
		}

		public static function getProgressInactiveColor(index:int):uint
		{
			if (index < 1)
				index=1;

			return _inactiveColors[index - 1];
		}

		public static function getProgressActiveColor(index:int, progress:Number):uint
		{
			if (index < 1)
				index=1;

			var color:uint=_activeColors[index - 1];

			if (progress >= 1)
				color=0x7BBF6A;

			return color;
		}
	}
}

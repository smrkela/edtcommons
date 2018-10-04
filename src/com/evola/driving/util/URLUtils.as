package com.evola.driving.util
{

	public class URLUtils
	{
		public function URLUtils()
		{
		}

		public static function smallProfileImage(serverUrl:String, userId:String):String
		{


			return serverUrl + '/resource?path=/users/' + userId + '/smallImage';
		}

	}
}

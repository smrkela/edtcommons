package com.evola.driving
{
	import com.evola.driving.util.EvolaDrivingModel;

	//[ResourceBundle("resources")]
	[Bindable]
	public class Session
	{


		public static var USERNAME:String=null; //Ime ulogovanog korisnika;
		public static var USER_ID:String=null; //ID ulogovanog korisnika;
		
		public static var model : EvolaDrivingModel = new EvolaDrivingModel();

		public function Session()
		{
		}

	}
}


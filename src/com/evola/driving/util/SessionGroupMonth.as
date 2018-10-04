package com.evola.driving.util
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class SessionGroupMonth
	{
		
		public var numberOfQuestions : int;
		public var year : int;
		public var month : int;
		public var date : Date;
		public var groups : ArrayCollection;
		
		public function SessionGroupMonth(date : Date, key : String)
		{
			this.date = date;
			this.numberOfQuestions=0;
			this.year = date.fullYear;
			this.month = date.month;
			this.groups=new ArrayCollection();
		}
		
		public function addGroup(group:SessionGroupDay):void
		{
			
			this.numberOfQuestions+=group.numberOfQuestions;
			this.groups.addItem(group);
		}
	}
}
package com.evola.driving.util
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class SessionGroupDay
	{
		public var date:Date;
		public var numberOfQuestions:int;
		public var key:String;
		public var sessions:ArrayCollection;
		
		public function SessionGroupDay(date:Date, key:String)
		{
			
			this.numberOfQuestions=0;
			this.date=date;
			this.key=key;
			this.sessions=new ArrayCollection();
		}
		
		public function addSession(session:Session):void
		{
			
			this.numberOfQuestions+=session.numberOfQuestions;
			this.sessions.addItem(session);
		}
	}
}
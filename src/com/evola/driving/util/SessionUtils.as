package com.evola.driving.util
{
	import mx.collections.ArrayCollection;
	import mx.collections.ListCollectionView;

	public class SessionUtils
	{

		public static function regroupSessions(values:XMLList):ArrayCollection
		{

			if (!values || values.length() == 0)
				return new ArrayCollection();

			var map:Object={}; //kljuc je "godina-mesec-dan", vrednost je SessionGroup
			var groups:ArrayCollection=new ArrayCollection();

			var sessions:ArrayCollection=new ArrayCollection();

			for each (var xml:XML in values)
			{

				var session:Session=new Session(xml);

				var key:String=createKey(session.date);

				if (key in map)
				{

					(map[key] as SessionGroupDay).addSession(session);
				}
				else
				{

					var group:SessionGroupDay=new SessionGroupDay(session.date, key);
					group.addSession(session);

					map[key]=group;
					groups.addItem(group);
				}
			}

			//sada prolazimo kroz grupe i formiramo grupe za mesece
			var monthGroups:ArrayCollection=new ArrayCollection();
			var monthMap:Object={}; //kljuc je "godina-mesec"

			for each (var group:SessionGroupDay in groups)
			{

				var key:String=createMonthKey(group.date);

				if (key in monthMap)
				{

					(monthMap[key] as SessionGroupMonth).addGroup(group);
				}
				else
				{

					var monthGroup:SessionGroupMonth=new SessionGroupMonth(group.date, key);
					monthGroup.addGroup(group);

					monthMap[key]=monthGroup;
					monthGroups.addItem(monthGroup);
				}
			}

			return monthGroups;
		}

		public static function calculateAllSessions(value:ListCollectionView):int
		{

			var sum:int=0;

			for each (var session:SessionGroupMonth in value)
			{

				sum+=session.numberOfQuestions;
			}

			return sum;
		}

		private static function createKey(date:Date):String
		{

			return date.fullYear + "-" + (date.month + 1) + "-" + date.date;
		}

		private static function createMonthKey(date:Date):String
		{

			return date.fullYear + "-" + (date.month + 1);
		}

	}
}

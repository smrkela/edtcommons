package com.evola.driving.util
{
	import com.evola.driving.model.ModelBase;
	
	import mx.collections.ArrayCollection;

	public class DrivingUtils
	{

		public static const INVALID_TEXT:String="invalid_question_text";
		public static const INVALID_ANSWER:String="invalid_question_answer";
		public static const INVALID_QUESTION_CATEGORY:String="invalid_question_category";
		public static const INVALID_DRIVING_CATEGORY:String="invalid_driving_category";
		public static const INVALID_IMAGES:String="invalid_question_images";
		public static const INVALID_GENERAL:String="general_issue";

		public static function getNumberOfQuestionsDataProvider(totalCount:int):ArrayCollection
		{

			var dp:ArrayCollection=new ArrayCollection();

			var a:Array=[10, 20, 50, 100, 200, 500, 1000];

			for each (var c:int in a)
			{

				if (c < totalCount)
				{

					dp.addItem({name: c + '', value: c});
				}
			}

			//prvo dodajemo za sve
			dp.addItem({name: "Sve (" + totalCount + ")", value: totalCount});

			return dp;
		}

		public static function getBaseEntity(entities:ArrayCollection, entity:ModelBase):ModelBase
		{

			if (!entities || !entity)
				return null;

			for each (var e:ModelBase in entities)
			{

				if (e.id && e.id == entity.id)
					return e;
			}

			return null;
		}

		public static function createStatObjectList(sessions:XMLList):ArrayCollection
		{

			var ac:ArrayCollection=new ArrayCollection();

			var maxValue:Number=0;

			for each (var x:XML in sessions)
			{

				var obj:Object={};

				obj.value=Number(x.attribute("number-of-questions")[0]);
				obj.date=FormattingUtils.parseJavaDateString(x.attribute("start")[0]);
				obj.uid=x.attribute("uid");

				maxValue=Math.max(obj.value, maxValue);

				ac.addItem(obj);
			}

			for each (var o:Object in ac)
			{

				o.maxValue=maxValue;
				o.percentValue=o.value / o.maxValue;
			}

			return ac;
		}

		public static function createPagingDataProvider(num:int):ArrayCollection
		{

			var result:ArrayCollection=new ArrayCollection();

			//ako imamo samo jednu stranicu onda vracamo praznu kolekciju jer onda nema smisla prikazivati stranice

			if (num > 1)
			{

				for (var i:int=0; i < num; i++)
				{

					result.addItem(i);
				}
			}

			return result;
		}
		
		public static function cleanText(text : String, charactersLimit : int) : String{
			
			if(!text)
				return text;
			
			//ogranicavamo tekst na N karaktera
			
			var addEllipsis : Boolean = text.length > charactersLimit;
			
			text = text.substr(0, charactersLimit);
			
			//uklanjamo new line karaktere
			text = text.replace("\n", " ");
			text = text.replace("\r", " ");
			
			if(addEllipsis)
				text += "...";
			
			return text;
		}

	}
}

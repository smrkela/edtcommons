package com.evola.driving.util
{

	public class Session
	{
		public var date:Date;
		public var numberOfQuestions:int;

		public function Session(xml:XML)
		{

			date=FormattingUtils.parseJavaDateString(xml.@start);
			numberOfQuestions=xml.attribute('number-of-questions');
		}
	}
}

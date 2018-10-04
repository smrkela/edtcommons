package com.evola.driving.util
{
	import flash.media.Sound;

	public class ThemeSounds
	{

		[Embed(source="sounds/success.mp3")]
		public static var questionSuccess:Class;

		[Embed(source="sounds/fail.mp3")]
		public static var questionFailure:Class;

		[Embed(source="sounds/finish.mp3")]
		public static var learningFinished:Class;
		
		[Embed(source="sounds/finish.mp3")]
		public static var testingFinished:Class;

		[Embed(source="sounds/level_up.mp3")]
		public static var levelUp:Class;

		private static var levelUpSound:Sound;
		private static var questionSuccessSound:Sound;
		private static var questionFailureSound:Sound;
		private static var learningFinishedSound:Sound;
		private static var testingFinishedSound:Sound;

		public function ThemeSounds()
		{
		}

		public static function playLevelUp():void
		{

			if (!levelUpSound)
				levelUpSound=new levelUp();

			levelUpSound.play();
		}

		public static function playQuestionSuccess():void
		{

			if (!questionSuccessSound)
				questionSuccessSound=new questionSuccess();

			questionSuccessSound.play();
		}
		
		public static function playQuestionFailure():void
		{
			
			if (!questionFailureSound)
				questionFailureSound=new questionFailure();
			
			questionFailureSound.play();
		}
		
		public static function playLearningFinish():void
		{
			
			if (!learningFinishedSound)
				learningFinishedSound=new learningFinished();
			
			learningFinishedSound.play();
		}
		
		public static function playTestingFinish():void
		{
			
			if (!testingFinishedSound)
				testingFinishedSound=new testingFinished();
			
			testingFinishedSound.play();
		}

	}
}

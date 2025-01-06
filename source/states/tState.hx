package states;

class tState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var funnyTextMWAHAHA:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		funnyTextMWAHAHA = new FlxText(0, 0, FlxG.width,
			"titties   \n
			fucking awesome"
			32);
		funnyTextMWAHAHA.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		funnyTextMWAHAHA.screenCenter(Y);
		add(funnyTextMWAHAHA);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT) {
				leftState = true;
			}
			else if(controls.BACK) {
				leftState = true;
			}

			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxTween.tween(funnyTextMWAHAHA, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
						MusicBeatState.switchState(new MainMenuState());
					}
				});
			}
		}
		super.update(elapsed);
	}
}

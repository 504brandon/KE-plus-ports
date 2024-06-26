import PlayState;
import Conductor;
import KadeEngineData;
import HelperFunctions;
import flixel.tweens.FlxTween;
import flixel.util.FlxStringUtil;

var state;
var didUIShit = false;

function create() {    
    state = FlxG.state;

    if (KadeEngineData.KEOptions.get("PEUI")) {
        if (PlayState.instance != null && state == PlayState.instance) {
            trace("PsychUI");

            for (obj in [state.songPosBG, state.songPosBar, state.songName])
                obj.alpha = 0;

            state.kadeEngineWatermark.visible = false;

            state.scoreTxt.size = 20;
        }
    }

    trace(KadeEngineData.KEOptions.get("PEUI"));
}

function startSong() {
    if (KadeEngineData.KEOptions.get("PEUI")) {
        state.songPosBG.loadGraphic(Paths.image("timeBar"));
        state.songPosBG.screenCenter();
        state.songPosBar.scale.x = 0.66;
        state.songPosBar.createFilledBar(0xff000000, 0xFFffffff);

        for (obj in [state.songPosBG, state.songPosBar, state.songName]) {
            obj.alpha = 0;

            FlxTween.tween(obj, {alpha: 1}, 0.5);
        }

        state.songName.size = 32;
        state.songPosBG.y = state.songName.y + (state.songName.height / 4);
        state.songPosBar.y = state.songPosBG.y + 4;
    }
}

function updatePost(elapsed) {
    if (KadeEngineData.KEOptions.get("PEUI")) {
        if (PlayState.instance != null && state == PlayState.instance) {
            state.scoreTxt.text = "Score: " + state.songScore + " | Misses: " + state.misses + " | Accuracy: " + HelperFunctions.truncateFloat(state.accuracy, 2) + "%";
            state.scoreTxt.screenCenter();
            state.scoreTxt.y = healthBar.y + 40;

            state.songName.text = FlxStringUtil.formatTime((FlxG.sound.music.length - Conductor.songPosition) / 1000);
        }
    }
}
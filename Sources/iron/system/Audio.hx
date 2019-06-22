package iron.system;

import kha.audio1.AudioChannel;

class Audio {

	public function new() {}

	public static function play(sound:kha.Sound, loop = false, stream = false):AudioChannel {
		#if arm_no_audio
		return null;
		#end
		if (stream && sound.compressedData != null) {
			return kha.audio1.Audio.stream(sound, loop); 
		}
		else if (sound.uncompressedData != null) {
			return kha.audio1.Audio.play(sound, loop);
		}
		else return null;
	}
}

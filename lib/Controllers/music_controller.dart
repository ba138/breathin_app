import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

class MusicController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final RxBool isPlaying = false.obs;

  Future<void> playAudio(String documentId) async {
    try {
      if (_audioPlayer.playing) {
        await _stopCurrentAudio();
      }

      final DocumentSnapshot doc = await _fetchAudioDocument(documentId);

      final audioUrl = _extractAudioUrl(doc);

      await _audioPlayer.setUrl(audioUrl);
      await _audioPlayer.play();

      isPlaying.value = true;
    } catch (error) {
      _handleError(error);
    }
  }

  Future<void> stopAudio() async {
    try {
      if (_audioPlayer.playing) {
        await _stopCurrentAudio();
      }
    } catch (error) {
      _handleError(error);
    }
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }

  Future<void> _stopCurrentAudio() async {
    await _audioPlayer.stop();
    isPlaying.value = false;
  }

  Future<DocumentSnapshot> _fetchAudioDocument(String documentId) async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('audioFiles')
        .doc(documentId)
        .get();

    if (!doc.exists) {
      throw Exception('Document not found in Firestore.');
    }

    return doc;
  }

  String _extractAudioUrl(DocumentSnapshot doc) {
    final audioUrl = doc['url'];
    if (audioUrl == null || audioUrl is! String) {
      throw Exception('Audio URL is invalid or not found.');
    }
    return audioUrl;
  }

  void _handleError(Object error) {
    Get.snackbar(
      'Error',
      error.toString(),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

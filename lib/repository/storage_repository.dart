// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:firebase/firebase.dart' as firebase;

class StorageRepository {
  static StorageRepository? _instance;
  StorageRepository._();
  static StorageRepository? get instance {
    if (_instance == null) {
      _instance = StorageRepository._();
    }
    return _instance;
  }

  final _storage = firebase.storage();

  /// 画像をアップロード
  Future<String> uploadData(String path, File file) async {
    final ref = _storage.ref().child(path);
    final snapshot = await ref.put(file).future;
    // 画像のデータをファイルからURLに直して表示
    final photoURL = await snapshot.ref.getDownloadURL();
    return photoURL.toString();
  }
}

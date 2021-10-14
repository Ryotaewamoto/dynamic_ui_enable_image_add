import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamic_ui_enable_image_add/domain/favorite_image.dart';

class FavoriteImageRepository {
  static FavoriteImageRepository? _instance;
  FavoriteImageRepository._();
  static FavoriteImageRepository? get instance {
    if (_instance == null) {
      _instance = FavoriteImageRepository._();
    }
    return _instance;
  }

  final _db = FirebaseFirestore.instance;

  /// NPOのリストを返す
  Future<List<FavoriteImage>> fetchFavoriteImageList() async {
    try {
      final snapshot = await _db.collection('favoriteImages').get();
      final favoriteImageList =
          snapshot.docs.map((doc) => FavoriteImage.fromDoc(doc)).toList();
      return favoriteImageList;
    } catch (e) {
      throw ('${e.toString()}');
    }
  }

  Future<void> addFavoriteImage({
    required FavoriteImage favoriteImage,
  }) async {
    final newDoc = _db.collection('favoriteImages').doc();
    try {
      await newDoc.set({'imageURL': favoriteImage.imageURL});
    } catch (e) {
      throw 'エラーが発生しました。\n電波の良いところで再度試してください。';
    }
  }
}

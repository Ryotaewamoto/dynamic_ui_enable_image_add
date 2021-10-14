import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteImage {
  String? imageURL;

  /// ローカル変数
  int? id;

  /// デフォルトコンストラクタ
  FavoriteImage({
    this.imageURL,
    this.id,
  });

  /// FireStoreからデータを取ってきた時に使用
  FavoriteImage.fromDoc(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final String imageURL = data['imageURL'];
    this.imageURL = imageURL;
    this.id = Random().nextInt(99999);
  }

  /// インスタンスを生成
  factory FavoriteImage.create() {
    return FavoriteImage(
      id: Random().nextInt(99999),
    );
  }
}

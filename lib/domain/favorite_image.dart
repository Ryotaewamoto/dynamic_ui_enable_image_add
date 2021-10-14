import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteImage {
  String? imageURL;
  Timestamp? createdAt;

  /// ローカル変数
  int? id;

  /// デフォルトコンストラクタ
  FavoriteImage({
    this.imageURL,
    this.id,
  });

  /// インスタンスを生成
  factory FavoriteImage.create() {
    return FavoriteImage(
      id: Random().nextInt(99999),
    );
  }

  /// FireStoreからデータを取ってきた時に使用
  FavoriteImage.fromDoc(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final String imageURL = data['imageURL'];
    final Timestamp createdAt = data['createdAt'];
    this.imageURL = imageURL;
    this.createdAt = createdAt;
    this.id = Random().nextInt(99999);
  }
}

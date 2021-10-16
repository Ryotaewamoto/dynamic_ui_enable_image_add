import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteImage {
  String? documentId;
  String? imageURL;
  Timestamp? createdAt;

  /// ローカル変数
  int? id;

  /// デフォルトコンストラクタ
  FavoriteImage({
    this.documentId,
    this.imageURL,
    this.createdAt,
    this.id,
  });

  /// インスタンスを生成
  factory FavoriteImage.create() {
    return FavoriteImage(
      id: Random().nextInt(99999),
    );
  }

  /// FireStoreからデータを取ってきた時に使用
  factory FavoriteImage.fromDoc(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final String documentId = doc.id;
    final String imageURL = data['imageURL'];
    final Timestamp createdAt = data['createdAt'];
    return FavoriteImage(
      documentId: documentId,
      imageURL: imageURL,
      createdAt: createdAt,
    );
  }
}

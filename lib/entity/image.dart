import 'dart:math';

class Image {
  String? imageURL;

  int id;

  /// デフォルトコンストラクタ
  Image({
    required this.id,
  });

  /// DocumentSnapshotが引数として渡された場合のコンストラクタ
  // Image.fromDoc(DocumentSnapshot doc) {
  //   this.imageURL = doc.data()['imageURL'];
  // }

  /// Image型のインスタンスを生成
  factory Image.create() {
    return Image(
      id: Random().nextInt(99999),
    );
  }
}

import 'package:flutter/material.dart';

/// 角丸カード
class ImageRoundedCard extends StatelessWidget {
  const ImageRoundedCard({
    Key? key,
    this.imageURL,
  }) : super(key: key);

  final String? imageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: this.imageURL != null
              ? Ink.image(
                  image: NetworkImage(this.imageURL.toString()),
                  child: InkWell(
                    onTap: () {
                      print('画像を選択');
                    },
                  ),
                  height: 400,
                  width: 200,
                  fit: BoxFit.fill,
                )
              : InkWell(
                  onTap: () {
                    print('画像を追加');
                  },
                  child: Container(
                    height: 400,
                    width: 200,
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                )),
    );
  }
}

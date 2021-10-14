import 'package:dynamic_ui_enable_image_add/domain/favorite_image.dart';
import 'package:dynamic_ui_enable_image_add/presentation/first/first_model.dart';
import 'package:flutter/material.dart';

/// 角丸カード
class ImageRoundedCard extends StatelessWidget {
  ImageRoundedCard({
    Key? key,
    required FirstModel this.firstModel,
    required FavoriteImage this.favoriteImage,
  }) : super(key: key);

  final FavoriteImage? favoriteImage;
  final FirstModel? firstModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: this.favoriteImage!.imageURL != null
              ? Ink.image(
                  image: NetworkImage(this.favoriteImage!.imageURL!),
                  child: InkWell(
                    onTap: () {},
                  ),
                  height: 400,
                  width: 200,
                  fit: BoxFit.fill,
                )
              : InkWell(
                  onTap: () async {
                    await this
                        .firstModel!
                        .uploadSubImageToStorage(this.favoriteImage!);
                  },
                  child: Container(
                    color: Colors.grey.withOpacity(0.5),
                    height: 400,
                    width: 200,
                    child: Icon(
                      Icons.add,
                      size: 40,
                    ),
                  ),
                )),
    );
  }
}

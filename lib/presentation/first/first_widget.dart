import 'package:dynamic_ui_enable_image_add/domain/favorite_image.dart';
import 'package:dynamic_ui_enable_image_add/presentation/first/first_model.dart';
import 'package:dynamic_ui_enable_image_add/widget/image_card.dart';
import 'package:flutter/material.dart';

class FirstWidget extends StatelessWidget {
  FirstWidget({
    Key? key,
    @required this.favoriteImageList,
    required FirstModel this.firstModel,
  }) : super(key: key);

  final List<FavoriteImage>? favoriteImageList;
  final FirstModel? firstModel;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: this
          .favoriteImageList!
          .map((favoriteImage) => ImageRoundedCard(
                favoriteImage: favoriteImage,
                firstModel: this.firstModel!,
              ))
          .toList(),
    );
  }
}

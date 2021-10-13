import 'package:dynamic_ui_enable_image_add/Widget/image_card.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String imageURL =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpm4joDet-mH_EJT9rH5hMrNF8c0yPYYswGA&usqp=CAU';

    List<Widget> _imageCards = [
      ImageRoundedCard(
        imageURL: imageURL,
      ),
      ImageRoundedCard(
        imageURL: imageURL,
      ),
      ImageRoundedCard(
        imageURL: imageURL,
      ),
      ImageRoundedCard(
        imageURL: imageURL,
      ),
      ImageRoundedCard(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('【Flutter Web】動的に画像を追加・削除できるUIを作成'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 160,
            ),
            child: Column(
              children: <Widget>[
                Wrap(
                  alignment: WrapAlignment.start,
                  children: _imageCards,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dynamic_ui_enable_image_add/presentation/first/first_model.dart';
import 'package:dynamic_ui_enable_image_add/presentation/first/first_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirstModel>(
      create: (_) => FirstModel()..init(),
      child: Consumer<FirstModel>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('【Flutter Web】動的に画像を追加・削除できるUIを作成'),
          ),
          body: model.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 160,
                      ),
                      child: Column(
                        children: <Widget>[
                          FirstWidget(
                            favoriteImageList: model.favoriteImageList,
                            firstModel: model,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      }),
    );
  }
}

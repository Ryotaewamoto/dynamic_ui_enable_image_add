import 'dart:html';

import 'package:dynamic_ui_enable_image_add/domain/favorite_image.dart';
import 'package:dynamic_ui_enable_image_add/repository/favorite_image_repository.dart';
import 'package:dynamic_ui_enable_image_add/repository/storage_repository.dart';
import 'package:flutter/material.dart';

class FirstModel extends ChangeNotifier {
  bool _isLoading = false;
  String? imageURL;
  List<FavoriteImage> favoriteImageList = [];

  FavoriteImageRepository? _favoriteImageRepository =
      FavoriteImageRepository.instance;
  StorageRepository? _storageRepository = StorageRepository.instance;

  get isLoading => _isLoading;

  Future<void> init() async {
    _startLoading();
    await _fetchFavoriteList();
    _addFavoriteImage();
    _endLoading();
  }

  /// 画像をstorageに保存
  Future<void> uploadSubImageToStorage(FavoriteImage favoriteImage) async {
    _uploadImage(onSelected: (file) async {
      _startLoading();
      final path = "favoriteImage/favoriteImage${favoriteImage.id}";
      // 新しいデータを追加
      this.imageURL = await _storageRepository!.uploadData(path, file);
      _changeImageURL(favoriteImage, this.imageURL!);
      await _favoriteImageRepository!
          .addFavoriteImage(favoriteImage: favoriteImage);
      _addFavoriteImage();
      _endLoading();
    });
  }

  /// Web上でファイルを開く
  Future<void> _uploadImage({required Function(File file) onSelected}) async {
    var uploadInput = FileUploadInputElement()..accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
      });
    });
  }

  // 画像を変更
  void _changeImageURL(FavoriteImage favoriteImage, String url) {
    this.favoriteImageList.forEach((element) {
      if (element.id == favoriteImage.id) {
        element.imageURL = url;
      }
    });
    notifyListeners();
  }

  Future<void> _fetchFavoriteList() async {
    this.favoriteImageList =
        await _favoriteImageRepository!.fetchFavoriteImageList();
  }

  void _addFavoriteImage() {
    this.favoriteImageList.add(FavoriteImage.create());
  }

  void _startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void _endLoading() {
    _isLoading = false;
    notifyListeners();
  }
}

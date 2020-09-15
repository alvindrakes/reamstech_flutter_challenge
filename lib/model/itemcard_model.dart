import 'package:flutter/foundation.dart';

class ItemCardModel {
  final String subtitle;
  final String title;
  final String imageUrl;

  ItemCardModel({
    @required this.subtitle,
    @required this.title,
    @required this.imageUrl,
  });

  factory ItemCardModel.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String title = data['name'] as String;
    final String subtitle = data['description'] as String;
    final String imageUrl = data['logo_url'] as String;

    return ItemCardModel(
      imageUrl: imageUrl,
      subtitle: subtitle,
      title: title,
    );
  }
}

import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  final String adPictureUrls;

  AdBanner({Key key, this.adPictureUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPictureUrls),
    );
  }
}

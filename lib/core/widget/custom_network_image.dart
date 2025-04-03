import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key, required this.imageurl,
    
  });

  final String  imageurl;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageurl);
  }
}

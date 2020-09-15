import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String subtitle;

  const ItemCard({
    Key key,
    @required this.title,
    @required this.imageUrl,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF727272).withOpacity(0.25),
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(15.0),
      height: 180,
      width: 50,
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

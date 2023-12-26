import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GymImageItem extends StatelessWidget {
  const GymImageItem({
    super.key,
    required this.imageUrl,
    required this.isFavorite,
    required this.onTapFavorite,
    this.requestingFavorite = false,
    this.width = double.infinity,
    this.height = double.infinity,
    this.iconSize = 32,
    this.iconPadding = const EdgeInsets.all(5),
    this.buttonPadding = const EdgeInsets.all(8),
    this.onTapImage,
  });

  final String imageUrl;
  final bool isFavorite;
  final VoidCallback? onTapImage;
  final VoidCallback onTapFavorite;
  final bool requestingFavorite;
  final double width;
  final double height;
  final double iconSize;
  final EdgeInsetsGeometry iconPadding;
  final EdgeInsetsGeometry buttonPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapImage,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            height: height,
            width: width,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) =>
                const Image(image: AssetImage('assets/images/default_image.png'), fit: BoxFit.fill),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            width: width,
            height: height,
            child: IconButton(
              onPressed: requestingFavorite ? null : onTapFavorite,
              iconSize: iconSize,
              padding: buttonPadding,
              icon: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                ),
                width: iconSize,
                height: iconSize,
                padding: iconPadding,
                child: requestingFavorite
                    ? const CircularProgressIndicator()
                    : SvgPicture.asset(
                        'assets/icons/heart.svg',
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

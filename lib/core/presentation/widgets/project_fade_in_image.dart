import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/assets_manager.dart';
import 'package:news_app/core/presentation/resources/values_manager.dart';

class ProjectFadeInImage extends StatelessWidget {
  const ProjectFadeInImage({
    Key? key,
    this.networkImageURL,
    this.height,
  }) : super(key: key);

  final String? networkImageURL;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage(kPlaceHolderImagePath),
      image: networkImageURL == null
          ? const AssetImage("assets/placeholder.jpg")
          : NetworkImage(networkImageURL!) as ImageProvider,
      //"as ImageProvider" casting is necessary because of the issue: https://stackoverflow.com/questions/66561177/the-argument-type-object-cant-be-assigned-to-the-parameter-type-imageprovide
      fit: BoxFit.fill,
      width: MediaQuery.sizeOf(context).width,
      height:
          height ?? MediaQuery.sizeOf(context).height * kDefaultHeightFactor,
      imageErrorBuilder: (context, exception, stackTrace) {
        return const Icon(
          Icons.file_download_off,
          color: Colors.white,
        );
      },
    );
  }
}

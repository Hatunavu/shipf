// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:validators/validators.dart';

mixin ImageCreator {
  static Widget imageWithPlaceHolderWidget(
      {required String url,
      double? width,
      int? maxWidth,
      double? height,
      int? maxHeight,
      Widget? placeHolder,
      BoxFit? fit,
      String? cacheKey,
      Map<String, String>? httpHeaders,
      ImageRenderMethodForWeb? imageRenderMethodForWeb}) {
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 300),
      fadeOutDuration: const Duration(milliseconds: 100),
      imageUrl: url,
      // placeholder: placeHolder != null ? (context, url) => placeHolder : null,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.4),
          highlightColor: Colors.grey.withOpacity(0.2),
          child: Container(
            color: Colors.white,
            height: height,
          ),
        );
      },
      errorWidget:
          placeHolder != null ? (context, url, error) => placeHolder : null,
      cacheKey: cacheKey,
      httpHeaders: httpHeaders,
      imageRenderMethodForWeb:
          imageRenderMethodForWeb ?? ImageRenderMethodForWeb.HtmlImage,
      width: width,
      maxWidthDiskCache: maxWidth,
      height: height,
      maxHeightDiskCache: maxHeight,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  static Widget imageProviderWithPlaceHolderWidget(
      {required String url,
      double? width,
      int? maxWidth,
      double? height,
      int? maxHeight,
      Widget? placeHolder,
      BoxFit? fit,
      String? cacheKey,
      Map<String, String>? httpHeaders,
      ImageRenderMethodForWeb? imageRenderMethodForWeb}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            url,
            errorListener: () => placeHolder,
            imageRenderMethodForWeb:
                imageRenderMethodForWeb ?? ImageRenderMethodForWeb.HtmlImage,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
          ),
          fit: fit ?? BoxFit.cover,
        ),
      ),
    );
  }

  // static Widget imageWithColorPlaceHolderWidget(
  //     {required String url,
  //     double? width,
  //     double? height,
  //     Color? color,
  //     BoxFit? fit,
  //     String? cacheKey,
  //     Map<String, String>? httpHeaders,
  //     ImageRenderMethodForWeb? imageRenderMethodForWeb}) {
  //   final placeHolder = Container(
  //     width: width,
  //     height: height,
  //     color: color ?? AppColors.darkGrey,
  //   );
  //   if (!isURL(url)) {
  //     return placeHolder;
  //   }
  //   return CachedNetworkImage(
  //     imageUrl: url,
  //     width: width,
  //     height: height,
  //     fadeInDuration: const Duration(milliseconds: 300),
  //     fadeOutDuration: const Duration(milliseconds: 100),
  //     placeholder: (context, url) => placeHolder,
  //     errorWidget: (context, url, error) => placeHolder,
  //     fit: fit ?? BoxFit.contain,
  //     cacheKey: cacheKey,
  //     httpHeaders: httpHeaders,
  //     imageRenderMethodForWeb:
  //         imageRenderMethodForWeb ?? ImageRenderMethodForWeb.HtmlImage,
  //   );
  // }

  static Widget imageWithPlaceHolder(
      {required String url,
      double? width,
      double? height,
      int? maxWidth,
      int? maxHeight,
      String? errorAssetUri,
      String? placeHolderAssetUri,
      BoxFit? fit,
      String? cacheKey,
      Map<String, String>? httpHeaders,
      ImageRenderMethodForWeb? imageRenderMethodForWeb}) {
    return imageWithPlaceHolderWidget(
      url: url,
      width: width,
      maxWidth: maxWidth,
      height: height,
      maxHeight: maxHeight,
      placeHolder: _createPlaceHolder(
          url, errorAssetUri, placeHolderAssetUri, fit, height, width),
      fit: fit ?? BoxFit.cover,
      cacheKey: cacheKey,
      httpHeaders: httpHeaders,
      imageRenderMethodForWeb:
          imageRenderMethodForWeb ?? ImageRenderMethodForWeb.HtmlImage,
    );
  }

  static Widget imageProviderWithPlaceHolder(
      {required String url,
      double? width,
      double? height,
      int? maxWidth,
      int? maxHeight,
      String? errorAssetUri,
      String? placeHolderAssetUri,
      BoxFit? fit,
      String? cacheKey,
      Map<String, String>? httpHeaders,
      ImageRenderMethodForWeb? imageRenderMethodForWeb}) {
    return imageProviderWithPlaceHolderWidget(
      url: url,
      width: width,
      maxWidth: maxWidth,
      height: height,
      maxHeight: maxHeight,
      placeHolder: _createPlaceHolder(
          url, errorAssetUri, placeHolderAssetUri, fit, height, width),
      fit: fit ?? BoxFit.cover,
      cacheKey: cacheKey,
      httpHeaders: httpHeaders,
      imageRenderMethodForWeb:
          imageRenderMethodForWeb ?? ImageRenderMethodForWeb.HtmlImage,
    );
  }

  static Widget _createPlaceHolder(String url, String? errorAssetUri,
      String? placeHolderAssetUri, BoxFit? fit, double? height, double? width) {
    Widget placeHolder;
    final Widget emptyPlaceHolder = SizedBox(
      width: width,
      height: height,
    );
    if (!isURL(url)) {
      String? errorAsset;
      if (errorAssetUri == null || errorAssetUri.isEmpty) {
        errorAsset = placeHolderAssetUri;
      }
      if (errorAsset == null || errorAsset.isEmpty) {
        return emptyPlaceHolder;
      } else {
        return ImageCreator.assetImage(
          imagePath: errorAsset,
          fit: fit ?? BoxFit.cover,
          width: width,
          height: height,
        );
      }
    } else {
      if (placeHolderAssetUri == null || placeHolderAssetUri.isEmpty) {
        placeHolder = emptyPlaceHolder;
      } else {
        placeHolder = ImageCreator.assetImage(
          imagePath: placeHolderAssetUri,
          fit: fit ?? BoxFit.cover,
          width: width,
          height: height,
        );
      }
    }
    return placeHolder;
  }

  static Widget imageFromUInt8List(
      {required String? bytes,
      double? width,
      double? height,
      String? placeHolderAssetUri,
      BoxFit? fit}) {
    final Widget placeHolder;
    if (placeHolderAssetUri == null) {
      placeHolder = SizedBox(
        width: width,
        height: height,
      );
    } else {
      placeHolder = ImageCreator.assetImage(
        imagePath: placeHolderAssetUri,
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      );
    }
    if (bytes == null) {
      return placeHolder;
    }
    return Image.memory(
      base64Decode(bytes),
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      errorBuilder: (context, url, error) => placeHolder,
    );
  }

  static Widget assetImage(
      {required String imagePath,
      double? width,
      double? height,
      BoxFit? fit = BoxFit.cover,
      Color? color}) {
    if (imagePath.contains(".svg")) {
      return SvgPicture.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    }
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }
}

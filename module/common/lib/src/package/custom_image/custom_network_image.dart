import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/src/package/custom_image/custom_mem_cahe.dart';
import 'package:common/src/package/shimmer/shimmer_loading_animation.dart';
import 'package:flutter/material.dart';

final class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    this.imageUrl,
    this.emptyWidget,
    this.memCache, // Artık nullable ve varsayılan değer yok
    this.boxFit = BoxFit.cover,
    this.loadingWidget,
    this.size,
  });

  final String? imageUrl;
  final Widget? emptyWidget;
  final Widget? loadingWidget;
  final CustomMemCache? memCache;
  final BoxFit boxFit;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null || url.isEmpty) {
      return emptyWidget ?? const SizedBox();
    }

    // Cihazın piksel yoğunluğunu al
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Eğer size verilmişse, ona göre cache boyutunu hesapla
    int? cacheWidth;
    int? cacheHeight;

    if (memCache != null) {
      cacheWidth = memCache!.width;
      cacheHeight = memCache!.height;
    } else if (size != null) {
      // Size varsa ve memCache yoksa, yüksek kalite için devicePixelRatio ile çarp
      cacheWidth = (size!.width * devicePixelRatio).toInt();
      cacheHeight = (size!.height * devicePixelRatio).toInt();
    }
    // Her ikisi de null ise, cache kullanma (orijinal boyutta olsun)

    return SizedBox(
      width: size?.width,
      height: size?.height,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: boxFit,
        filterQuality: FilterQuality.high,
        memCacheWidth: cacheWidth,
        memCacheHeight: cacheHeight,
        progressIndicatorBuilder: (context, url, progress) {
          return loadingWidget ??
              ShimmerLoadingAnimation(
                width: size?.width,
                height: size?.height,
              );
        },
        errorWidget: (context, url, error) {
          return emptyWidget ?? const SizedBox();
        },
      ),
    );
  }
}

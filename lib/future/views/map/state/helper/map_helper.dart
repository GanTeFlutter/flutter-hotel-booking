part of '../map_cubit.dart';

Future<BitmapDescriptor> getCircularMarkerFromCache(String imageUrl) async {
  try {
    final imageProvider = CachedNetworkImageProvider(imageUrl);
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);
    final completer = Completer<ui.Image>();

    // Listener'ı bir kere kullan ve sonra kaldır
    late ImageStreamListener listener;
    listener = ImageStreamListener(
      (info, _) {
        if (!completer.isCompleted) {
          completer.complete(info.image);
        }
        imageStream.removeListener(listener);
      },
      onError: (exception, stackTrace) {
        if (!completer.isCompleted) {
          completer.completeError(exception, stackTrace);
        }
        imageStream.removeListener(listener);
      },
    );

    imageStream.addListener(listener);

    final image = await completer.future;
    const size = 50.0;
    const border = 3.0;
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder)
      ..drawCircle(
        const Offset(size / 2, size / 2),
        size / 2,
        Paint()..color = Colors.white,
      )
      ..clipPath(
        Path()..addOval(
          Rect.fromCircle(
            center: const Offset(size / 2, size / 2),
            radius: (size / 2) - border,
          ),
        ),
      );

    paintImage(
      canvas: canvas,
      rect: const Rect.fromLTWH(
        border,
        border,
        size - border * 2,
        size - border * 2,
      ),
      image: image,
      fit: BoxFit.cover,
    );

    final img = await recorder.endRecording().toImage(
      size.toInt(),
      size.toInt(),
    );
    final data = await img.toByteData(format: ui.ImageByteFormat.png);

    if (data != null) {
      return BitmapDescriptor.bytes(data.buffer.asUint8List());
    }
  } on Exception catch (e) {
    debugPrint('Circular marker oluşturulamadı: $e');
  }
  return BitmapDescriptor.defaultMarker;
}

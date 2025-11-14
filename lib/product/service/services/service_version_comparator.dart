class VersionComparator {
  /// Versiyon string'ini integer listesine çevirir
  /// "v1.0.5" veya "1.0.5" -> [1, 0, 5]
  static List<int> _parse(String version) {
    return version
        .trim() // Boşlukları temizle
        .replaceAll(RegExp(r'[^0-9\.]'), '') // Sadece rakam ve nokta bırak
        .split('.')
        .where((e) => e.isNotEmpty) // Boş parçaları atla
        .map((e) => int.tryParse(e) ?? 0)
        .toList();
  }

  /// İki versiyonu karşılaştırır
  ///
  /// [localVersion]: Cihazda yüklü olan versiyon
  /// [remoteVersion]: Firebase'den gelen minimum versiyon
  ///
  /// Returns:
  /// - true = Local versiyon güncel veya daha yeni
  /// - false = Local versiyon eski, güncelleme gerekli
  static bool compare(String localVersion, String remoteVersion) {
    final local = _parse(localVersion);
    final remote = _parse(remoteVersion);
    final maxLength = local.length > remote.length
        ? local.length
        : remote.length;

    for (var i = 0; i < maxLength; i++) {
      final l = local.length > i ? local[i] : 0;
      final r = remote.length > i ? remote[i] : 0;

      if (l > r) return true;
      if (l < r) return false;
    }

    return true;
  }
}

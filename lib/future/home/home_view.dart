import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/service/notification/service_notification_helper.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Güncelleme Dialog Test'),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                final result = await DialogHelper.showUpdateDialog(
                  onPrimaryPressed: () {},
                  onSecondaryPressed: () {},
                );

                if (result ?? false) {
                } else {}
              },
              icon: const Icon(Icons.system_update),
              label: const Text('Normal Güncelleme'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {
                DialogHelper.showForceUpdateDialog(
                  onPrimaryPressed: () {},
                );
              },
              icon: const Icon(Icons.system_update_alt),
              label: const Text('Zorunlu Güncelleme'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),

            const Divider(height: 40),

            ElevatedButton(
              onPressed: () {
                DialogHelper.showUpdateDialog(
                  title: 'Yeni Versiyon v2.5.0 📱',
                  description:
                      'Bug düzeltmeleri ve performans iyileştirmeleri içeren yeni versiyonu yükleyin.',
                  primaryButtonText: "App Store'a Git",
                  secondaryButtonText: 'Atla',
                );
              },
              child: const Text('Özelleştirilmiş Normal'),
            ),

            ElevatedButton(
              onPressed: () {
                DialogHelper.showForceUpdateDialog(
                  title: 'Kritik Güncelleme! 🔴',
                  description:
                      'Güvenlik güncellemesi yüklemeniz gerekmektedir. Uygulamayı kullanmak için güncelleme zorunludur.',
                  primaryButtonText: 'Hemen Güncelle',
                  onPrimaryPressed: () {},
                );
              },
              child: const Text('Özelleştirilmiş Zorunlu'),
            ),
          ],
        ),
      ),
    );
  }
}

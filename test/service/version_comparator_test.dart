import 'package:flutter_hotel_booking/product/service/services/service_version_comparator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VersionComparator Tests', () {
    test('Aynı versiyonlar eşit olmalı', () {
      expect(VersionComparator.compare('1.0.5', '1.0.5'), true);
      expect(VersionComparator.compare('2.3.4', '2.3.4'), true);
    });

    test('Local daha eski ise false dönmeli', () {
      expect(VersionComparator.compare('1.0.5', '1.0.6'), false);
      expect(VersionComparator.compare('1.0.5', '1.2.0'), false);
      expect(VersionComparator.compare('1.9.9', '2.0.0'), false);
    });

    test('Local daha yeni ise true dönmeli', () {
      expect(VersionComparator.compare('1.0.6', '1.0.5'), true);
      expect(VersionComparator.compare('2.0.0', '1.9.9'), true);
      expect(VersionComparator.compare('1.2.0', '1.0.5'), true);
    });

    test('Farklı uzunluktaki versiyonları karşılaştırabilmeli', () {
      expect(VersionComparator.compare('1.0', '1.0.0'), true);
      expect(VersionComparator.compare('1.0.0', '1.0'), true);
      expect(VersionComparator.compare('1.0', '1.0.1'), false);
      expect(VersionComparator.compare('1.0.5.2', '1.0.5'), true);
    });

    test('v prefix ile versiyonları handle edebilmeli', () {
      expect(VersionComparator.compare('v1.0.5', '1.0.5'), true);
      expect(VersionComparator.compare('1.0.5', 'v1.0.5'), true);
      expect(VersionComparator.compare('v1.0.5', 'v1.0.6'), false);
    });

    test('Boşlukları temizleyebilmeli', () {
      expect(VersionComparator.compare(' 1.0.5 ', '1.0.5'), true);
      expect(VersionComparator.compare('1.0.5', ' 1.0.5 '), true);
    });

    test("Beta, alpha gibi suffix'leri handle edebilmeli", () {
      expect(VersionComparator.compare('1.0.5-beta', '1.0.5'), true);
      expect(VersionComparator.compare('1.0.5-alpha', '1.0.4'), true);
    });

    test('Hatalı formatları handle edebilmeli', () {
      expect(VersionComparator.compare('1..0.5', '1.0.5'), true);
      expect(VersionComparator.compare('abc1.0.5', '1.0.5'), true);
    });

    test('Büyük versiyon numaralarını karşılaştırabilmeli', () {
      expect(VersionComparator.compare('1.0.15', '1.0.5'), true);
      expect(VersionComparator.compare('1.10.0', '1.9.0'), true);
      expect(VersionComparator.compare('10.0.0', '9.99.99'), true);
    });
  });
}

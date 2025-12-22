// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  fullName: json['fullName'] as String?,
  email: json['email'] as String?,
  photoUrl: json['photoUrl'] as String?,
  nickname: json['nickname'] as String?,
  favoriteHotels:
      (json['favoriteHotels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  isGuest: json['isGuest'] as bool? ?? false,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'nickname': instance.nickname,
      'favoriteHotels': instance.favoriteHotels,
      'isGuest': instance.isGuest,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      name: json['name'] as String,
      code: json['code'] as String,
      phone: json['phone'] as String,
      capital: json['capital'] as String?,
      emoji: json['emoji'] as String,
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'phone': instance.phone,
      'capital': instance.capital,
      'emoji': instance.emoji,
    };

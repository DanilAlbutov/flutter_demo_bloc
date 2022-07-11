// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      json['id'] as int,
      json['first_name'] as String,
      json['last_name'] as String,
      json['username'] as String,
      json['avatar'] as String,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.secondName,
      'username': instance.userName,
      'avatar': instance.avatarUrl,
    };

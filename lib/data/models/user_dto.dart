import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_demo_bloc/data/models/user_card_model.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  UserDTO(
    this.id,
    this.firstName,
    this.secondName,
    this.userName,
    this.avatarUrl,
    this.email,
  );

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  final int id;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String secondName;

  @JsonKey(name: 'username')
  final String userName;

  @JsonKey(name: 'avatar')
  final String avatarUrl;

  @JsonKey(name: 'email')
  final String email;
}

extension UserDTOToDomain on UserDTO {
  UserCardModel toDomain() {
    return UserCardModel(
      id,
      firstName,
      secondName,
      userName,
      avatarUrl,
      email,
    );
  }
}

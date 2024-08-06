import 'package:hive/hive.dart';

//part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phoneNumber;

  @HiveField(2)
  String email;

  @HiveField(3)
  String idType;

  @HiveField(4)
  String idNumber;

  @HiveField(5)
  DateTime dateOfBirth;

  @HiveField(6)
  String password;

  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.idType,
    required this.idNumber,
    required this.dateOfBirth,
    required this.password,
  });
}

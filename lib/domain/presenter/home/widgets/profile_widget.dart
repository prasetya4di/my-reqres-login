import 'package:flutter/material.dart';
import 'package:my_reqres_login/domain/entities/user.dart';
import 'package:my_reqres_login/domain/presenter/home/widgets/profile_image.dart';
import 'package:my_reqres_login/domain/presenter/home/widgets/text_email.dart';
import 'package:my_reqres_login/domain/presenter/home/widgets/text_name.dart';

class ProfileWidget extends StatelessWidget {
  final User user;

  const ProfileWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileImage(imageUrl: user.avatar),
        TextEmail(email: user.email),
        TextName(firstName: user.firstName, lastName: user.lastName),
      ],
    );
  }
}

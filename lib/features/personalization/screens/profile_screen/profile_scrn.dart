import 'package:flutter/material.dart';
import 'package:someone_datingapp/comman/layouts/profile_card/user_profile_card.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          userProfileTileMain(),
        ],
      ),
    ));
  }
}

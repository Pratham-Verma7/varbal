import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:someone_datingapp/comman/layouts/list_tiles/settings_menu_tile.dart';
import 'package:someone_datingapp/comman/layouts/list_tiles/user_profile.dart';
import 'package:someone_datingapp/comman/widgets/appbar/appbar.dart';
import 'package:someone_datingapp/data/repositories/authentication_repo/authentication_repository.dart';
import 'package:someone_datingapp/utils/constants/sizes.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SAppBar(
          title: Text(
            'Settings',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              // const BSectionHeading(
              //   title: 'Settings',
              // ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              const BSettingMenuTile(
                  title: 'My College',
                  icon: Iconsax.building,
                  subTitle: 'Galgotias College of Engineering and Technology'),
              const SizedBox(height: Sizes.spaceBtwSections),
              // user profile card
              const SUserProfileTile(),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.signOut(),
                      child: const Text('Logout'))),
              const SizedBox(
                height: Sizes.spaceBtwSections * 2.5,
              )
            ],
          ),
        ));
  }
}

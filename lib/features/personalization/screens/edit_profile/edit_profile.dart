import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/comman/shimmer/shimmer.dart';
import 'package:someone_datingapp/comman/texts/section_heading.dart';
import 'package:someone_datingapp/comman/widgets/appbar/appbar.dart';
import 'package:someone_datingapp/features/personalization/controllers/user_controller.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/edit_screens/change_bio.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/edit_screens/change_emailid.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/edit_screens/change_gender.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/edit_screens/change_name.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/edit_screens/change_username.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/widgets/circular_img_frame.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/widgets/edit_profile_menu_tile.dart';
import 'package:someone_datingapp/utils/constants/images_str.dart';
import 'package:someone_datingapp/utils/constants/sizes.dart';
import 'package:someone_datingapp/utils/formatters/formatter.dart';

class editProfileScreen extends StatelessWidget {
  const editProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
        appBar: SAppBar(
          showBackArrow: true,
          title: Text('Edit Profile',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage = controller.user.value.profileUrl;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : SImages.profileImg;
                        return (controller.imageUploading.value)
                            ? const BShimmerEffect(width: 120, height: 120)
                            : SCircularImage(
                                image: image,
                                width: 120,
                                height: 120,
                                isNetworkImage: networkImage.isNotEmpty,
                              );
                      }),
                      TextButton(
                          onPressed: () => controller.uploadProfilePicture(),
                          child: const Text('Change Profile Picture')),
                    ],
                  ),
                ),
                const SizedBox(height: Sizes.spaceBtwItems),
                // BSectionHeading(title: 'Public ')
                Obx(() {
                  return Column(children: [
                    SEditProfileMenu(
                      title: 'Name',
                      value: controller.user.value.fullName,
                      onPressed: () => Get.to(() => const changeName()),
                    ),
                    SEditProfileMenu(
                      title: 'Username',
                      value: controller.user.value.username,
                      onPressed: () => Get.to(() => const changeUsername()),
                    ),
                    SEditProfileMenu(
                      title: 'Bio',
                      value: controller.user.value.bio,
                      isScrollableOverflow: true,
                      onPressed: () => Get.to(const changeBio()),
                    ),
                  ]);
                }),

                const SizedBox(
                  height: Sizes.spaceBtwSections,
                ),
                const BSectionHeading(title: "Personal Information"),
                const SizedBox(
                  height: Sizes.spaceBtwItems,
                ),
                Obx(() {
                  return Column(children: [
                    SEditProfileMenu(
                      title: 'Email ID',
                      value: controller.user.value.email,
                      onPressed: () => Get.to(const changeEmailid()),
                    ),
                    SEditProfileMenu(
                      title: 'Gender',
                      value: controller.user.value.gender,
                      onPressed: () => Get.to(const changeGender()),
                    ),
                    SEditProfileMenu(
                      title: 'Phone Number',
                      value: SFormatter.formatPhoneNumber(
                          controller.user.value.phoneNo),
                      onPressed: () {},
                    ),
                    SEditProfileMenu(
                      title: 'Date of Birth',
                      value: controller.user.value.dob,
                      onPressed: () {},
                    ),
                  ]);
                }),
              ],
            ),
          ),
        ));
  }
}

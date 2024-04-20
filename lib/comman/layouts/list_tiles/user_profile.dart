import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:someone_datingapp/comman/shimmer/shimmer.dart';
import 'package:someone_datingapp/features/personalization/controllers/user_controller.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/widgets/circular_img_frame.dart';
import 'package:someone_datingapp/utils/constants/colors.dart';
import 'package:someone_datingapp/utils/constants/images_str.dart';
import 'package:someone_datingapp/utils/helpers/helper_functions.dart';

class SUserProfileTile extends StatelessWidget {
  const SUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
        title: Text('Ayush Yadav',
            style: Theme.of(context).textTheme.headlineSmall),
        subtitle: Text('@ayush-yadavv',
            style: Theme.of(context).textTheme.labelLarge),
        leading: Obx(() {
          final networkImage = controller.user.value.profileUrl;
          final image =
              networkImage.isNotEmpty ? networkImage : SImages.profileImg;
          return (controller.imageUploading.value)
              ? const BShimmerEffect(width: 60, height: 60)
              : SCircularImage(
                  image: image,
                  width: 60,
                  height: 60,
                  isNetworkImage: networkImage.isNotEmpty,
                );
        }),
        trailing: IconButton(
          icon: Icon(
            Iconsax.edit,
            color: SHelperFunctions.isDarkMode(context)
                ? SColors.white
                : SColors.black,
          ),
          onPressed: () {},
        ));
  }
}

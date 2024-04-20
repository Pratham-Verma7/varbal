import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/comman/containers/primary_header_container.dart';
import 'package:someone_datingapp/comman/shimmer/shimmer.dart';
import 'package:someone_datingapp/features/personalization/controllers/user_controller.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/widgets/circular_img_frame.dart';
import 'package:someone_datingapp/utils/constants/colors.dart';
import 'package:someone_datingapp/utils/constants/images_str.dart';
import 'package:someone_datingapp/utils/constants/sizes.dart';
import 'package:someone_datingapp/utils/formatters/formatter.dart';
import 'package:someone_datingapp/utils/helpers/helper_functions.dart';

class userProfileImgTile extends StatelessWidget {
  const userProfileImgTile({
    super.key,
    this.avatarRadius = 70.0,
    required this.likes,
    required this.profileCoverImg,
    required this.profileImg,
    this.leadingWidget,
  });

  final double avatarRadius;
  final int likes;
  final AssetImage profileCoverImg;
  final AssetImage profileImg;
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final double screenWidth = SHelperFunctions.screenWidth();
    return Stack(
      children: [
        SizedBox(
          height: (screenWidth / 2 + avatarRadius) - 20,
        ),
        SPrimaryHeaderContainer(
          bgcolor: SColors.primary,
          child: Image(
            fit: BoxFit.cover,
            image: profileCoverImg,
            width: screenWidth,
            height: screenWidth / 2,
          ),
        ),
        Positioned(
          left: Sizes.defaultSpace,
          top: (screenWidth / 2) - (avatarRadius + 20),
          child: Obx(() {
            final networkImage = controller.user.value.profileUrl;
            final image =
                networkImage.isNotEmpty ? networkImage : SImages.profileImg;
            return (controller.imageUploading.value)
                ? BShimmerEffect(
                    width: avatarRadius * 2, height: avatarRadius * 2)
                : SCircularImage(
                    image: image,
                    width: avatarRadius * 2,
                    height: avatarRadius * 2,
                    isNetworkImage: networkImage.isNotEmpty,
                  );
          }),
          // CircleAvatar(
          //   radius: avatarRadius,
          //   backgroundColor: SColors.black,
          //   foregroundImage: profileImg,
          // ),
        ),
        Positioned(
            top: (screenWidth / 2),
            right: Sizes.defaultSpace,
            child: SizedBox(
              // color: SColors.primary.withOpacity(0.75),
              height: avatarRadius - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        SFormatter.formatLikes(likes),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        'Likes',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: Sizes.spaceBtwItems * 1.5,
                  ),
                  leadingWidget ?? Container(),
                ],
              ),
            )),
      ],
    );
  }
}

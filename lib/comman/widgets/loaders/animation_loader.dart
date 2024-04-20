import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:someone_datingapp/utils/constants/colors.dart';
import 'package:someone_datingapp/utils/constants/sizes.dart';

class SAnimationLoaderWidget extends StatelessWidget {
  const SAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: Sizes.defaultSpace),
          Text(text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: Sizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionPressed,
                      style: OutlinedButton.styleFrom(
                        backgroundColor: SColors.dark,
                      ),
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: SColors.light),
                      )))
              : const SizedBox(),
        ],
      ),
    );
  }
}

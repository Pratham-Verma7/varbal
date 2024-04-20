import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/features/personalization/controllers/editform_update_controllers/change_gender_controller.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/edit_fields_scafold.dart';
import 'package:someone_datingapp/utils/constants/colors.dart';

class changeGender extends StatelessWidget {
  const changeGender({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateGenderController());

    return editProfileFieldsScafold(
      controller: controller,
      appBarTitle: 'Gender',
      description:
          'This wont be shown on your profile. We use this data for analysis and never share it with other users.',
      onSaveButtonPressed: () => controller.updateGender(),
      formKey: controller.updateGenderFormKey,
      formChild: Column(
        children: [
          Obx(() => RadioListTile<String>(
                title: const Text('Male'),
                value: 'Male',
                activeColor: SColors.primary,
                groupValue: controller.selectedGender.value,
                onChanged: (value) {
                  if (value != null) controller.setSelectedGender(value);
                },
              )),
          Obx(() => RadioListTile<String>(
                title: const Text('Female'),
                value: 'Female',
                activeColor: SColors.primary,
                groupValue: controller.selectedGender.value,
                onChanged: (value) {
                  if (value != null) controller.setSelectedGender(value);
                },
              )),
        ],
      ),
    );
  }
}

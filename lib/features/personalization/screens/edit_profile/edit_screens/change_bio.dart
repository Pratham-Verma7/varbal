import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/features/personalization/controllers/editform_update_controllers/change_bio_controller.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/edit_fields_scafold.dart';
import 'package:someone_datingapp/utils/validators/validation.dart';

class changeBio extends StatelessWidget {
  const changeBio({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateBioController());
    return editProfileFieldsScafold(
      controller: controller,
      appBarTitle: 'Change Bio',
      description: 'Change your bio',
      onSaveButtonPressed: () => controller.updateProfileBio(),
      formKey: controller.updateProfileBioFormKey,
      formChild: Column(
        children: [
          TextFormField(
            controller: controller.bio,
            expands: false,
            minLines: 1,
            maxLines: 14,
            maxLength: 150,
            onChanged: (value) {
              if ('\n'.allMatches(value).length >= 18) {
                controller.bio.text =
                    value.substring(0, value.lastIndexOf('\n'));
              }
            },
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your full name',
            ),
            validator: (value) => SValidator.validateEmptyText('Bio', value),
          ),
        ],
      ),
    );
  }
}

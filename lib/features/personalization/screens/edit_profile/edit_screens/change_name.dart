import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/features/personalization/controllers/editform_update_controllers/change_name_controller.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/edit_fields_scafold.dart';
import 'package:someone_datingapp/utils/validators/validation.dart';

class changeName extends StatelessWidget {
  const changeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    
    return editProfileFieldsScafold(
      controller: controller,
      appBarTitle: 'Change Name',
      description: 'Change your name',
      onSaveButtonPressed: () => controller.updateProfileName(),
      formKey: controller.updateProfileNameFormKey,
      formChild: Column(
        children: [
          TextFormField(
            controller: controller.fullName,
            expands: false,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your full name',
            ),
            validator: (value) => SValidator.validateEmptyText('Name', value),
          ),
        ],
      ),
    );
  }
}

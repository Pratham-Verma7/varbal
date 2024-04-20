import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/features/personalization/controllers/editform_update_controllers/change_emailid_controller.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/edit_fields_scafold.dart';
import 'package:someone_datingapp/utils/validators/validation.dart';

class changeEmailid extends StatelessWidget {
  const changeEmailid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateEmailidController());
    return editProfileFieldsScafold(
      controller: controller,
      appBarTitle: 'Change Emailid',
      description: 'Change your emailid',
      onSaveButtonPressed: () => controller.updateProfileEmail(),
      formKey: controller.updateProfileEmailidFormKey,
      formChild: Column(
        children: [
          TextFormField(
            controller: controller.email,
            expands: false,
            decoration: const InputDecoration(
              labelText: 'Emailid',
              hintText: 'Enter your emailid',
            ),
            validator: (value) => SValidator.validEmail(value),
          ),
        ],
      ),
    );
  }
}

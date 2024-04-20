import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/features/personalization/controllers/editform_update_controllers/change_username_controller.dart';
import 'package:someone_datingapp/features/personalization/screens/edit_profile/edit_fields_scafold.dart';

class changeUsername extends StatelessWidget {
  const changeUsername({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUsernameController());

    return editProfileFieldsScafold(
      controller: controller,
      appBarTitle: 'Change Username',
      description: 'Change your username',
      onSaveButtonPressed: () => controller.updateProfileUsername(),
      formKey: controller.updateProfileUsernameFormKey,
      formChild: Column(
        children: [
          TextFormField(
            controller: controller.userName,
            expands: false,
            onChanged: controller.onUsernameChanged,
            validator: (Value) => controller.usernameValidator(Value),
            decoration: const InputDecoration(
              labelText: 'Username',
              hintText: 'Enter your username',
            ),
          )
        ],
      ),
    );
  }
}

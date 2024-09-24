
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_order/core/utils/app_colors.dart';
import 'package:task_order/core/widgets/custom_button_widget.dart';
import 'package:task_order/core/widgets/text_form_widget.dart';
import 'package:task_order/features/order/provider/customer_provider.dart';
import 'package:task_order/models/customer_model.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.formKey,
    required this.customerProvider, required this.customButton,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final GlobalKey<FormState> formKey;
  final CustomerProvider customerProvider;
  final CustomButton customButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white.withOpacity(0.8),
      title: const Text('Add Customer'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormFieldWidget(
              labelText: 'Name',
              controller: nameController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              keyboardType: TextInputType.text,
            ),
            TextFormFieldWidget(
              labelText: 'Phone',
              controller: phoneController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Phone number is required';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
            ),
            TextFormFieldWidget(
              labelText: 'Address',
              controller: addressController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Address is required';
                }
                return null;
              },
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        customButton,
      ],
    );
  }
}

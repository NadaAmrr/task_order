import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_order/core/utils/app_colors.dart';
import 'package:task_order/core/utils/app_style.dart';
import 'package:task_order/core/widgets/text_form_widget.dart';
import 'package:task_order/features/order/provider/customer_provider.dart';
import 'package:task_order/features/order/provider/products_provider.dart';
import 'package:task_order/models/customer_model.dart';
import 'package:task_order/models/product_model.dart';

class MakeOrderSection extends StatelessWidget {
  MakeOrderSection({super.key, required this.width, required this.height});
  final double width;
  final double height;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ProductsProvider>(context).getProductsByGroupId(101);
    var customerProvider = Provider.of<CustomerProvider>(context);
    final formKey = GlobalKey<FormState>();
    return Container(
      width: width,
      color: AppColors.main,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          orderWidget(products),
          orderInfoWidget(context, customerProvider, formKey),
        ],
      ),
    );
  }

  Widget orderInfoWidget(
      BuildContext context, CustomerProvider customerProvider, GlobalKey<FormState>  formKey) {
    return Container(
      color: AppColors.grey,
      height: height * 0.3,
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: customerProvider.customerModel == null
                ? ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
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
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    final customer = CustomerModel(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      address: addressController.text,
                                    );

                                    // Add customer to the provider
                                    Provider.of<CustomerProvider>(context, listen: false)
                                        .addCustomer(customer);
                                    Provider.of<CustomerProvider>(context, listen: false)
                                        .customerModel = customer;

                                    Navigator.of(context).pop(); // Close the dialog after adding
                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.main),
                    ),
                    child: const Text(
                      "Add Customer",
                      style: AppStyle.styleBold16,
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Customer Name: ${customerProvider.customerModel!.name}'),
                      Text(
                          'Customer Phone: ${customerProvider.customerModel!.phone}'),
                      Text(
                          'Customer Address: ${customerProvider.customerModel!.address}'),
                    ],
                  ),
          ),
          const ListTile(
            title: Text('Total: 1200'),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.main),
              ),
              child: const Text(
                "Make Order",
                style: AppStyle.styleBold16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget orderWidget(List<ProductModel> products) {
    return Expanded(
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: ListTile(
                  leading: SizedBox(
                      width: width * 0.4,
                      child: Image.asset(
                        product.img,
                        fit: BoxFit.contain,
                      )),
                  title: Text(product.name),
                  subtitle: Text('Price: ${product.price}'),
                  onTap: () {
                    print('Selected: ${product.name}');
                  }),
            );
          }),
    );
  }
}

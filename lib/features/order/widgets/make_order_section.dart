import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_order/core/utils/app_colors.dart';
import 'package:task_order/core/utils/app_style.dart';
import 'package:task_order/core/widgets/custom_button_widget.dart';
import 'package:task_order/core/widgets/dailog_widget.dart';
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

  Widget orderInfoWidget(BuildContext context,
      CustomerProvider customerProvider, GlobalKey<FormState> formKey) {
    return Container(
      color: AppColors.grey,
      height: height * 0.3,
      padding: const EdgeInsets.all(12),
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
                          return DialogWidget(
                            nameController: nameController,
                            phoneController: phoneController,
                            addressController: addressController,
                            formKey: formKey,
                            customerProvider: customerProvider,
                            customButton: CustomButton(
                              buttonName: 'Add Customer',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  customerProvider.makeId();

                                  final customer = CustomerModel(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    address: addressController.text,
                                    id: customerProvider.newCustomerId
                                        .toString(),
                                  );

                                  customerProvider.addCustomer(customer);
                                  customerProvider.customerModel = customer;

                                  Navigator.of(context).pop();
                                }
                              },
                            ),
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
                      SizedBox(width: height * .2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Edit customer
                          Expanded(
                              child: CustomButton(
                                  buttonName: 'Edit',
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DialogWidget(
                                          nameController: nameController,
                                          phoneController: phoneController,
                                          addressController: addressController,
                                          formKey: formKey,
                                          customerProvider: customerProvider,
                                          customButton: CustomButton(
                                            buttonName: 'Edit Customer',
                                            onPressed: () {
                                              final updatedCustomer = CustomerModel(
                                                id: customerProvider.customerModel!.id,
                                                name: nameController.text,
                                                phone: phoneController.text,
                                                address: addressController.text,
                                              );
                                              customerProvider.editCustomer(updatedCustomer);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        );
                                      },
                                    );

                                  })),
                          SizedBox(width: width * .1),
                          /// Delete customer
                          Expanded(
                              child: CustomButton(
                                  buttonName: 'Delete', onPressed: () {
                                    customerProvider.deleteCustomer(customerProvider.customerModel!.id);
                              })),
                        ],
                      )
                    ],
                  ),
          ),
          const ListTile(
            title: Text('Total: 1200'),
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              buttonName: 'Make Order',
              onPressed: () {},
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

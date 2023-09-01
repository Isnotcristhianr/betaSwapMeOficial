import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_button.dart';
import '../../../components/no_data.dart';
import '../../../components/screen_title.dart';
import '../controllers/cart_controller.dart';
import 'widgets/cart_item.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GetBuilder<CartController>(
          builder: (_) => ListView(
            children: [
              30.verticalSpace,
              const ScreenTitle(
                title: 'Intercambios',
                dividerEndIndent: 280,
              ),
              20.verticalSpace,
              ElevatedButton(
                onPressed: () async {
                  final XFile? pickedImage = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    maxWidth: 800,
                    maxHeight: 600,
                  );

                  if (pickedImage != null) {
                    // Agrega el producto seleccionado desde la galería
                    controller.addNewProductFromGallery(pickedImage.path);
                  }
                },
                child: Text('Agregar Intercambio'),
              ),
              Divider(), // Línea divisora

              // Aquí se muestran los intercambios existentes
              controller.products.isEmpty
                  ? const NoData(
                      text: 'Aun no tienes intercambios en el carrito')
                  : ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) => CartItem(
                        product: controller.products[index],
                      ).animate().fade().slideX(
                            duration: const Duration(milliseconds: 300),
                            begin: -1,
                            curve: Curves.easeInSine,
                          ),
                      shrinkWrap: true,
                      primary: false,
                    ),
              30.verticalSpace,

              // Aquí se muestran los nuevos productos seleccionados desde la galería
              if (controller.newProductsFromGallery.isNotEmpty)
                ...controller.newProductsFromGallery.map((newProduct) => CartItem(
                      product: newProduct,
                    ).animate().fade().slideX(
                          duration: const Duration(milliseconds: 300),
                          begin: -1,
                          curve: Curves.easeInSine,
                        )),

              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Importa el paquete carousel_slider
import '../../../components/product_item.dart';
import '../../../components/screen_title.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            40.verticalSpace,
            const ScreenTitle(
              title: 'SwapMe',
            ),
            0.verticalSpace,
            // Contenedor que contiene el carrusel
            SizedBox(
              height: 125.h, // Ajusta la altura según tus necesidades
              child: CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  autoPlay: true, // Reproducción automática
                  autoPlayInterval: const Duration(seconds: 5), // Intervalo de cambio de diapositivas
                ),
                items: [
                  // Diapositiva 1
                  CustomSlider(
                    value: 0.5,
                    onChanged: (value) {
                      // Manejar el cambio en el valor del carrusel
                    },
                    thumbImage: 'assets/images/b1.png',
                  ),
                  // Diapositiva 2
                  CustomSlider(
                    value: 0.5,
                    onChanged: (value) {
                      // Manejar el cambio en el valor del carrusel
                    },
                    thumbImage: 'assets/images/b2.png',
                  ),
                  CustomSlider(
                    value: 0.5,
                    onChanged: (value) {
                      // Manejar el cambio en el valor del carrusel
                    },
                    thumbImage: 'assets/images/b3.png',
                  ),
                ],
              ),
            ),

            // Cuadrícula de productos
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                mainAxisExtent: 260.h,
              ),
              shrinkWrap: true,
              primary: false,
              itemCount: controller.products.length,
              //producto
              itemBuilder: (context, index) => ProductItem(
                product: controller.products[index],
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}

// Widget personalizado para el carrusel con imagen de indicador
class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final String thumbImage;

  const CustomSlider({super.key, 
    required this.value,
    required this.onChanged,
    required this.thumbImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          thumbImage,
          width: 200.0, // Ajusta el ancho de la imagen del carrusel
          height: 100.0, // Ajusta la altura de la imagen del carrusel
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

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
            30.verticalSpace,
            const ScreenTitle(
              title: 'Inicio',
            ),
            20.verticalSpace,

            // Contenedor que contiene el carrusel
            Container(
              height: 100.h, // Ajusta la altura según tus necesidades
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9, // Ajusta la relación de aspecto según tus necesidades
                  enableInfiniteScroll: true,
                  autoPlay: true, // Reproducción automática
                  autoPlayInterval: Duration(seconds: 5), // Intervalo de cambio de diapositivas
                ),
                items: [
                  // Diapositiva 1
                  CustomSlider(
                    value: 0.5,
                    onChanged: (value) {
                      // Manejar el cambio en el valor del carrusel
                    },
                    thumbImage: 'assets/images/p3.png',
                  ),
                  // Diapositiva 2
                  CustomSlider(
                    value: 0.5,
                    onChanged: (value) {
                      // Manejar el cambio en el valor del carrusel
                    },
                    thumbImage: 'assets/images/p5.png',
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

  CustomSlider({
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

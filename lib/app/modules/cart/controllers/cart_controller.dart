import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../components/custom_snackbar.dart';
import '../../../data/models/product_model.dart';
import '../../base/controllers/base_controller.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  List<ProductModel> products = [];
  var total = 0.0;
  final List<ProductModel> newProductsFromGallery = [];
  
  get uuid => null;

  @override
  void onInit() {
    getCartProducts();
    super.onInit();
  }

  onPurchaseNowPressed() {
    Get.find<BaseController>().changeScreen(0);
    CustomSnackBar.showCustomSnackBar(
      title: 'Purchased',
      message: 'Order placed with success',
    );
  }

  onIncreasePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    product.quantity = product.quantity! + 1;
    getCartProducts();
    update(['ProductQuantity']);
  }

  onDecreasePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    if (product.quantity != 0) {
      product.quantity = product.quantity! - 1;
      getCartProducts();
      update(['ProductQuantity']);
    }
  }

  onDeletePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    product.quantity = 0;
    getCartProducts();
  }

  getCartProducts() {
    products = DummyHelper.products.where((p) => p.quantity! > 0).toList();
    total = products.fold<double>(0, (p, c) => p + c.price! * c.quantity!);
    update();
  }

  // Función para agregar un nuevo producto desde la galería
  void addNewProductFromGallery(String imagePath) {
  // Crea un nuevo producto utilizando la ruta de la imagen seleccionada
  final ProductModel newProduct = ProductModel(
    id: uuid.v4(), // Genera un ID único
    image: imagePath,
    // Otros atributos según tus necesidades
  );

  // Agrega el nuevo producto a la lista de nuevos productos desde la galería
  newProductsFromGallery.add(newProduct);

  // Actualiza la interfaz de usuario
  update();
}

  // Función para confirmar la adición de los productos desde la galería a la lista principal
  void confirmProductsFromGallery() {
    DummyHelper.products.addAll(newProductsFromGallery);
    newProductsFromGallery.clear();
    getCartProducts();
  }
}

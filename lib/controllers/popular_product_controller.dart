import 'package:food_delivery_project/data/repository/popular_product_repo.dart';
import 'package:food_delivery_project/models/products_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("success get products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      update();
    } else {}
  }
}

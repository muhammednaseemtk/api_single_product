
import 'package:dio/dio.dart';
import 'package:single_product/model/product_model.dart';

class ProductService {
  Dio dio = Dio();

  Future<ProductModel?> fetchProduct() async {
    try{
      Response response = await dio.get('https://dummyjson.com/products/1');
      if(response.statusCode == 200){
        return ProductModel.fromJson(response.data);
      }else{
        throw Exception('product not found');
      }
    }catch (e) {
      print('Service Error: $e');
      return null;
    }
  }
}
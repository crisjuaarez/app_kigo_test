import 'package:http/http.dart' as http;

import '../../../../core/constants/api_urls.dart';

class ProductsDataSource {
  Future<http.Response> getProducts() async {
    final response = await http.get(Uri.parse(APIUrls.productsUrl));
    return response;
  }
}

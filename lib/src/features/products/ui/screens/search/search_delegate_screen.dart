import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';
import 'widgets/search_product_list.dart';

class MySearchDelegate extends SearchDelegate<Product?> {
  final List<Product> items;

  MySearchDelegate(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = items
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return SearchProductList(products: results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = items
        .where(
            (item) => item.title.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return SearchProductList(products: suggestions);
  }
}

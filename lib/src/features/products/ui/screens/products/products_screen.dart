import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products_provider.dart';
import 'widgets/category_list.dart';
import 'widgets/products_grid_list.dart';
import 'widgets/search_text_field.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ProductsProvider>().getProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductsProvider>(
        builder: (_, notifier, __) {
          if (notifier.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (notifier.failure != null) {
            return Center(child: Text(notifier.failure!.message));
          }
          return const Column(
            children: [
              SearchTextField(),
              Expanded(flex: 1, child: CategoryList()),
              Expanded(flex: 9, child: ProductsGridList()),
            ],
          );
        },
      ),
    );
  }
}

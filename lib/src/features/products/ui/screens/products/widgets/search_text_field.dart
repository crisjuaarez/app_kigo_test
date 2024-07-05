import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../login/ui/widgets/my_text_form_field.dart';
import '../../../providers/products_provider.dart';
import '../../search/search_delegate_screen.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
      canRequestFocus: false,
      labelText: 'Buscar',
      hintText: 'Buscar productos',
      prefixIcon: const Icon(Icons.search),
      readOnly: true,
      onTap: () {
        showSearch(
          context: context,
          delegate: MySearchDelegate(
            context.read<ProductsProvider>().allProducts,
          ),
        );
      },
    );
  }
}

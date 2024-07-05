import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constants/app_dimens.dart';
import '../../../../../../core/constants/app_font_sizes.dart';
import '../../../../../../ui/theme/app_theme.dart';
import '../../../providers/products_provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(builder: (_, notifier, __) {
      final categories = notifier.categories;
      return ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: AppDimens.defaultHorizontalPadding,
        itemBuilder: (_, i) {
          final category = categories[i];
          final isSelected = category == notifier.selectedCategory;
          return ChoiceChip(
            showCheckmark: false,
            selectedColor: AppTheme.primaryColor,
            backgroundColor: Colors.white,
            label: Text(
              category.name.toUpperCase(),
              style: TextStyle(
                fontSize: AppFontSizes.bodyMedium,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppTheme.secondaryColor,
              ),
            ),
            selected: category == notifier.selectedCategory,
            onSelected: (_) => notifier.selectedCategory = category,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
      );
    });
  }
}

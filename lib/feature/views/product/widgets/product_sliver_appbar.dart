import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../../widgets/buttons/cart_button.dart';
import '../../../widgets/buttons/closure_button.dart';
import '../models/product.dart';

class ProductSliverAppBar extends StatelessWidget {
  final Product product;

  const ProductSliverAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
        background: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(product.photos[0].bigImage, fit: BoxFit.fill),
              const Positioned(
                left: 0,
                top: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 5.0),
                  child: CartCounterButton(reverseRow: true),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                  child: ClosureButton(onPressed: () {
                    Navigator.of(context).pop();
                  }),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Text(
                  "D E S I G N E D  I N  G E R M A N Y",
                  style: context.theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class CatalogSaleView extends StatelessWidget {
  const CatalogSaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          const SliverAppBar(
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
                title: Text('Goa', textScaleFactor: 1),
                background: FlutterLogo()
            ),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("D E S I G N E D  I N  G E R M A N Y",
                        style: context.theme.textTheme.bodyLarge,
                      ),
                    ),
                    Container(
                      width: 15,
                      height: 3,
                      decoration: BoxDecoration(
                        color: context.theme.primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("EXAMPLE TEXT SALE NAME",
                        style: context.theme.textTheme.bodyMedium,
                      ),
                    ),
                    Text("99999999 ₽",
                      style: context.theme.textTheme.bodyMedium,
                    ),
                    Text("color parameter",
                      style: context.theme.textTheme.bodySmall,
                    ),
                    const CircleAvatar( /// sale color
                      backgroundColor: Colors.black,
                    ),
                    /// TODO: sale size picker
                    Text("long sale description text\nlong sale description text\nlong sale description text\nlong sale description text\n",
                      style: context.theme.textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                    /// TODO: expanded text clickers with text Детали, уход, доставка и оплата, Где купить
                    const SizedBox(height: 40),
                    Text("ART \$апртикул",
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 40),
                    Text("ЕСТЬ ВОПРОС? СВЯЖИТЕСЬ С НАМИ\nПН-ПТ 10:00- 19:00 (мск)",
                      style: context.theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
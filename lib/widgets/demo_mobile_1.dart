import 'package:flutter/material.dart';
import 'package:flutter_common_package/extensions/extensions.dart';
import 'package:flutter_theme_builder/app/asset_path.dart';
import 'package:flutter_theme_builder/widgets/mobile_container.dart';

class DemoMobile1 extends StatefulWidget {
  const DemoMobile1({Key? key}) : super(key: key);

  @override
  State<DemoMobile1> createState() => _DemoMobile1State();
}

class _DemoMobile1State extends State<DemoMobile1> {
  @override
  Widget build(BuildContext context) {
    return MobileContainer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                8.width,
                Text('10:49'),
                Spacer(),
                8.width,
              ],
            ),
          ),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  onPressed: () {},
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ],
              ),
              body: ListView(
                children: [
                  Text(
                    'Monstera\nUnique',
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(AssetPaths.hero),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              Icon(Icons.auto_awesome),
                              Text('Most Popular'),
                              Text('This is a popular plant in our store'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

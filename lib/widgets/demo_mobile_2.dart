import 'package:flutter/material.dart';
import 'package:flutter_common_package/extensions/extensions.dart';
import 'package:flutter_theme_builder/app/asset_path.dart';
import 'package:flutter_theme_builder/widgets/mobile_container.dart';

class DemoMobile2 extends StatefulWidget {
  const DemoMobile2({Key? key}) : super(key: key);

  @override
  State<DemoMobile2> createState() => _DemoMobile2State();
}

class _DemoMobile2State extends State<DemoMobile2> {
  late TextTheme _textTheme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _textTheme = theme.textTheme;

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
                Icon(
                  Icons.signal_wifi_4_bar,
                ),
                Icon(
                  Icons.signal_cellular_4_bar,
                ),
                Icon(
                  Icons.battery_full,
                ),
              ],
            ),
          ),
          Expanded(
            child: Scaffold(
              appBar: AppBar(),
              body: ListView(
                children: [
                  ...[
                    Text(
                      'Today',
                      style: _textTheme.displayLarge,
                    ),
                  ].map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: e,
                  )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                    child: Image.asset(
                      AssetPaths.hero,
                    ),
                  ),
                  16.height,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          24.width,
                          ...[
                            _buildCard(
                              icon: Icons.auto_awesome,
                              title: 'Most Popular',
                              body: 'This is a popular plant in our store',
                            ),
                            _buildCard(
                              icon: Icons.assignment,
                              title: 'Easy Care',
                              body: 'This plant is appropriate for beginners',
                            ),
                            _buildCard(
                              icon: Icons.park,
                              title: 'Faux Available',
                              body: 'Get the same look without the maintenance',
                            ),
                          ].map((e) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: e,
                          )).toList(),
                          24.width,
                        ],
                      ),
                    ),
                  ),
                  ...[
                    12.height,
                    Text(
                      'Care',
                      style: _textTheme.headlineSmall,
                    ),
                    _buildListTile(
                      Icons.water,
                      'Water every Tuesday',
                    ),
                    _buildListTile(
                      Icons.eco,
                      'Feed once monthly',
                    ),
                    12.height,
                    Text(
                      'About',
                      style: _textTheme.headlineSmall,
                    ),
                    _buildListTile(
                      Icons.brightness_high,
                      'Moderate light',
                    ),
                    _buildListTile(
                      Icons.grass,
                      'Slightly dry, well-draining soil',
                    ),
                  ].map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: e,
                  )),
                  120.height,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData iconData, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            iconData,
          ),
          16.width,
          Text(
            text,
            style: _textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String body,
  }) {
    return Card(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 130,
          minHeight: 120,
          minWidth: 130,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
              ),
              16.height,
              Text(
                title,
                style: _textTheme.titleSmall,
              ),
              4.height,
              Text(
                body,
                style: _textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

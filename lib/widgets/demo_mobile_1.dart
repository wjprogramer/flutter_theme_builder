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
                    style: _textTheme.displayLarge,
                  ),
                  Image.asset(AssetPaths.hero),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
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
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Care',
                    style: _textTheme.headlineSmall,
                  ),
                  Text(
                    'Water every Tuesday',
                    style: _textTheme.titleMedium,
                  ),
                  Text(
                    'Feed once monthly',
                    style: _textTheme.titleMedium,
                  ),
                  Text(
                    'Moderate light',
                    style: _textTheme.titleMedium,
                  ),
                  Text(
                    'Slightly dry, well-draining soil',
                    style: _textTheme.titleMedium,
                  ),
                ],
              ),
            ),
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

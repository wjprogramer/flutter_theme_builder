import 'package:flutter/material.dart';
import 'package:flutter_common_package/extensions/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: theme.colorScheme.onTertiaryContainer,
                      ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.lightbulb,
                                color: theme.colorScheme.onTertiaryContainer,
                              ),
                              8.width,
                              Expanded(
                                child: Text(
                                  'During the winter your plants slow down and need less water.',
                                  style: TextStyle(
                                    color: theme.colorScheme.onTertiaryContainer,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  16.height,
                  ...[
                    ...<_CardData>[
                      _CardData(
                        svgBackgroundAsset: AssetPaths.plant1,
                        bgHeight: 250,
                        bgRight: -80,
                        bgBottom: -132,
                        title: 'Living Room',
                        sub1: 'Water',
                        content1: 'hoya australis',
                        sub2: 'Feed',
                        content2: 'monstera siltepecana',
                        checked1: true,
                        checked2: true,
                      ),
                      _CardData(
                        svgBackgroundAsset: AssetPaths.plant2,
                        bgHeight: 150,
                        bgRight: -80,
                        bgBottom: -32,
                        title: 'Kitchen',
                        sub1: 'Water',
                        content1: 'pilea peperomiodes',
                        sub2: 'Water',
                        content2: 'hoya australis',
                        checked1: true,
                        checked2: true,
                      ),
                      _CardData(
                        svgBackgroundAsset: AssetPaths.plant3,
                        bgHeight: 275,
                        bgRight: -80,
                        bgBottom: -157,
                        title: 'Bedroom',
                        sub1: 'Water',
                        content1: 'monstera siltepecana',
                        sub2: 'Water',
                        content2: 'philodendron brandi',
                        checked1: true,
                        checked2: true,
                      ),
                    ].map((data) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildCard(theme, data),
                    )),
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

  Widget _buildCard(ThemeData theme, _CardData data) {
    final a = theme.colorScheme.surface;

    return Card(
      // color: theme.colorScheme.onSurface,
      // TODO: 參考的網站上寫 onSurface，但實際卻是 primary with opacity
      color: theme.colorScheme.primary.withOpacity(.05),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon(
                //   icon,
                // ),
                // 16.height,
                Text(
                  data.title,
                  style: _textTheme.headlineSmall,
                ),
                24.height,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: data.checked1, onChanged: (_) {},
                    ),
                    40.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            data.sub1,
                            style: _textTheme.bodyMedium,
                          ),
                          Text(
                            data.content1,
                            style: _textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                24.height,

                // 4.height,
                // Text(
                //   body,
                //   style: _textTheme.bodySmall,
                // ),
              ],
            ),
          ),
          Positioned(
            right: data.bgRight,
            bottom: data.bgBottom,
            child: SvgPicture.asset(
              data.svgBackgroundAsset,
              height: data.bgHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardData {

  _CardData({
    required this.svgBackgroundAsset,
    required this.bgHeight,
    required this.bgRight,
    required this.bgBottom,
    required this.title,
    required this.sub1,
    required this.content1,
    required this.sub2,
    required this.content2,
    required this.checked1,
    required this.checked2,
  });

  String svgBackgroundAsset;
  double bgHeight;
  double bgRight;
  double bgBottom;

  String title;
  String sub1;
  String content1;
  String sub2;
  String content2;
  bool checked1;
  bool checked2;

}


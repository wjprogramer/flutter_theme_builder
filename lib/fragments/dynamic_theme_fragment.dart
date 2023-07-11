import 'package:flutter/material.dart';
import 'package:flutter_common_package/extensions/extensions.dart';

class DynamicThemeFragment extends StatefulWidget {
  const DynamicThemeFragment({Key? key}) : super(key: key);

  @override
  State<DynamicThemeFragment> createState() => _DynamicThemeFragmentState();
}

class _DynamicThemeFragmentState extends State<DynamicThemeFragment> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 720) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildLeft()),
              Expanded(child: _buildRight()),
            ],
          );
        }

        // < 720: 1 column
        return _buildMainList();
        // DemoMobile1
      },
    );
  }

  Widget _buildMainList() {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        ..._buildLeftItems(),
        ..._buildRightItems(),
      ],
    );
  }

  Widget _buildLeft() {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 48,
      ),
      children: _buildLeftItems(),
    );
  }

  Widget _buildRight() {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(32),
        children: _buildRightItems(),
      ),
    );
  }

  List<Widget> _buildLeftItems() {
    return [
      64.height,
      Text(
        'Visualize dynamic color',
      ),
      Text(
        'A user-generated scheme is derived from a user’s wallpaper selection to create 5 key colors with dynamic color. Select a wallpaper or add your own to see user generated color in action.',
      ),
      Text(
        'Learn more about dynamic color.',
      ),
    ];
  }

  List<Widget> _buildRightItems() {
    return [
      // Center(
      //   child: DemoMobile1(),
      // ),
      Wrap(
        children: [
          ButtonBar(),
          ElevatedButton(
            onPressed: () {},
            child: Text('Button'),
          ),
          FilledButton(
            onPressed: () {},
            child: Text('Button'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('Button'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Button'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('Button'),
          ),
          TextButton(
            onPressed: null,
            child: Text('Button'),
          ),
        ],
      ),
    ];
  }
}

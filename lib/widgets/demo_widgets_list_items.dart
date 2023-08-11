import 'package:flutter/material.dart';
import 'package:flutter_common_package/extensions/extensions.dart';

List<Widget> buildDemoWidgetsListItems() {
  final text = Text('Assist');
  final iconWithText = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.info, size: 14,),
      4.width,
      text,
    ],
  );

  final filterText = Text('Filter');
  final filterIconWithText = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.filter_list_outlined, size: 14,),
      4.width,
      filterText,
    ],
  );

  final buttonText = Text('Button');
  final buttonIconWithText = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.add, size: 14,),
      4.width,
      buttonText,
    ],
  );

  return [
    Chip(
      label: text,
    ),
    ActionChip(
      label: iconWithText,
      onPressed: () {},
    ),
    FilterChip(
      label: filterIconWithText,
      onSelected: (v) {},
    ),

    OutlinedButton(
      onPressed: () {},
      child: text,
    ),
    OutlinedButton(
      onPressed: () {},
      child: buttonIconWithText,
    ),
    ElevatedButton(
      onPressed: () {},
      child: buttonText,
    ),
    TextButton(
      onPressed: () {},
      child: buttonText,
    ),
    FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
    ButtonBar(
      children: [
        TextButton(
          onPressed: () {},
          child: Text('Android'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Windows'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Web'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Linux'),
        ),
      ],
    ),
  ];
}
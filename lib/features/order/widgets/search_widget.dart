
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
            decoration: const InputDecoration(
              labelText: 'Search Products',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {}));
  }
}

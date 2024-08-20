import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              // Scaffold.of(context).openDrawer();
            },
            icon: const Center(
              child: Icon(
                Icons.sort,
                color: Colors.white,
                textDirection: TextDirection.rtl,
                size: 40.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

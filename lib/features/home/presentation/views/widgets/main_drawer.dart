import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Center(
              child: Image.asset('assets/images/itlogo0002.png'),
            ),
          ),
          ListTile(
            leading: const Text(
              '🔌',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            title: const Text(
              'Voltage',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Text(
              '⚡',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            title: const Text(
              'Current',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

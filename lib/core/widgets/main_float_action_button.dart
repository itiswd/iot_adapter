import 'package:flutter/material.dart';

class MainFloatActionButton extends StatelessWidget {
  final String image;
  final void Function()? onPressed;
  const MainFloatActionButton({
    super.key,
    required this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        gradient: LinearGradient(
          colors: [
            Color(0xff5ea0fe),
            Color(0xffa8e2ed),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            image,
            width: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

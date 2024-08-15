import 'package:flutter/material.dart';

class MainTextFieldCard extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String hint;
  final void Function(String)? onSubmitted;
  const MainTextFieldCard({
    super.key,
    required this.controller,
    required this.text,
    this.onSubmitted,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xff5ea0fe),
              Color(0xffa8e2ed),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 12,
            top: 12,
            bottom: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: hint,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  cursorColor: Colors.grey,
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                  onSubmitted: onSubmitted,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

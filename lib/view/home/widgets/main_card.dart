import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:iot_adapter/core/utils/app_routers.dart';
import 'package:iot_adapter/core/utils/styles.dart';

class MainCard extends StatelessWidget {
  final String name;
  final String value;
  final String signal;
  final String image;
  final String rout;

  const MainCard({
    super.key,
    required this.name,
    required this.value,
    required this.signal,
    required this.image,
    required this.rout,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          if (rout == AppRouters.kVolt || rout == AppRouters.kCurrent) {
            GoRouter.of(context).push(rout);
          }
        },
        child: Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 8.0,
          ),
          clipBehavior: Clip.hardEdge,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
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
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        //Image
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(64),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              image,
                              width: 32,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Value
                            Text(
                              value,
                              style: Styles.mainValue,
                            ),
                            const SizedBox(width: 4.0),
                            //signal
                            Text(
                              signal,
                              style: Styles.signal,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[100],
                          ),
                        ),
                        //Name
                        Text(
                          name,
                          style: Styles.mainNames,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

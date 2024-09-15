import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.srgbToLinearGamma()),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // PreferredSize(
          //   preferredSize: Size(MediaQuery.of(context).size.width, 50),
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //       left: 10,
          //       right: 10,
          //       bottom: 10,
          //     ),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(18.0),
          //       child: Container(
          //         height: 40.0,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

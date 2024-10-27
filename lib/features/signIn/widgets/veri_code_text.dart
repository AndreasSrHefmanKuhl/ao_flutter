import 'package:ao/config/sizes.dart';
import 'package:flutter/material.dart';

class VeriCodeText extends StatelessWidget {
  const VeriCodeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 250,
      width: 380,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Verification Code',
                style: TextStyle(
                    fontSize: headlineTextSize, fontWeight: FontWeight.bold),
              ),
              Text('we have sended the Link to your Email account',
                  style: TextStyle(
                      fontSize: defaultTextSize, fontWeight: FontWeight.bold)),
            ]),
      ),
    );
  }
}

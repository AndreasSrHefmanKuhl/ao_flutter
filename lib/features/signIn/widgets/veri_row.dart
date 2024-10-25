import 'package:ao/features/signIn/widgets/veri_cont.dart';
import 'package:flutter/material.dart';

class VeriRow extends StatelessWidget {
  const VeriRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      VeriCont(),
      SizedBox(width: 5),
      VeriCont(),
      SizedBox(width: 5),
      VeriCont(),
      SizedBox(width: 5),
      VeriCont(),
    ]);
  }
}

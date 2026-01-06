import 'package:flutter/material.dart';
import 'package:microdeed/design_system/styles.dart';

class InterestPage extends StatelessWidget {
  const InterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("What interests you?", style: Styles.displayBold,),
            Text("Choose atleast one to see opportunities near you", style: Styles.bodyRegular,),
          ]
        )
      )
           
    );
  }
}
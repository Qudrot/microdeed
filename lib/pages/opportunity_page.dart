import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';

class OpportunityPage extends StatelessWidget {
  const OpportunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.location_city, color: DSColors.tealMain, size: Spacers.sm,),
                Text("Surulere, Lagos", style: Styles.base,),
                Icon(Icons.arrow_drop_up)
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}
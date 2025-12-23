import 'package:flutter/material.dart';
import 'package:microdeed/animation/circular_timer.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/styles.dart';

//const Color backgroundColor = Color(0xFFF8FDF8);

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DSColors.surface,
        appBar: AppBar(
          //backgroundColor: DSColors.surface,
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.cancel_outlined)),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text('Sorted donated books', 
              style: Styles.bodyRegular),
              Text("City Library", style: Styles.captionMedium,),
              const SizedBox(height: 32),
              const CircularTimer(
                duration: Duration(minutes: 10)),
                const SizedBox(height: 32),
                Container(

                ),
            ],
          ),
        ),
      ),
    );
  }
}

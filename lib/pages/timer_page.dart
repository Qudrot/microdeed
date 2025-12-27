import 'package:flutter/material.dart';
import 'package:microdeed/animation/circular_timer.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/shadows.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/widgets/taskcard.dart';

//const Color backgroundColor = Color(0xFFF8FDF8);

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final isActive = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DSColors.surface,
        appBar: AppBar(
          //backgroundColor: DSColors.surface,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.cancel_outlined),
            ),
          ],
        ),
        body: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sorted donated books',
                style: Styles.bodyRegular.copyWith(
                  color: DSColors.secondaryText,
                ),
              ),
              SizedBox(height: Spacers.base),
              Text(
                "City Library",
                style: Styles.captionMedium.copyWith(
                  color: DSColors.secondaryText,
                ),
              ),
              const SizedBox(height: Spacers.lg),
              const CircularTimer(duration: Duration(minutes: 10)),
              const SizedBox(height: Spacers.md),
              Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(16),
                width: Spacers.x5l,
                height: Spacers.xl,
                decoration: BoxDecoration(
                  color: DSColors.tealLight,
                  borderRadius: BorderRadius.circular(Spacers.mmd),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: DSColors.tealMain,
                      size: Spacers.sm,
                    ),
                    SizedBox(width: Spacers.base),
                    Text(
                      "On track",
                      style: Styles.microSmall.copyWith(
                        color: DSColors.tealMain,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: DSColors.surface,
                  //border: OutlinedBorder
                  borderRadius: BorderRadius.circular(Spacers.sm),
                  boxShadow: DSShadows.elevated,
                ),
                padding: EdgeInsets.all(Spacers.md),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Task Steps", style: Styles.base),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: DSColors.primaryText,
                          ),
                        ),
                      ],
                    ),
                    TaskCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


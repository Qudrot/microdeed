import 'package:flutter/material.dart';
import 'package:microdeed/animation/circular_timer.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/shadows.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/widgets/InfoBadge.dart';
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
              icon: const Icon(Icons.cancel_rounded),
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

              const SizedBox(height: Spacers.mmd),

              // Timer
              const CircularTimer(duration: Duration(minutes: 10)),

              const SizedBox(height: Spacers.sm),

              // On track
              Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(16),
                width: Spacers.x5l,
                height: Spacers.xl,
                decoration: BoxDecoration(
                  color: DSColors.tealLight,
                  borderRadius: BorderRadius.circular(Spacers.mmd),
                ),

                child: InfoBadge(),
              ),

              const SizedBox(height: Spacers.base),

              // Task steps
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(Spacers.md),
                  padding: const EdgeInsets.all(Spacers.md),
                  decoration: BoxDecoration(
                    color: DSColors.surface,
                    borderRadius: BorderRadius.circular(Spacers.sm),
                    boxShadow: DSShadows.card,
                    border: Border.all(color: DSColors.background, width: 1.5),
                  ),

                  child: Column(
                    children: [
                      // Task header
                      Row(
                        children: [
                          Text(
                            "Task Steps",
                            style: Styles.base.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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

                      // Task card
                      Expanded(
                        child: Column(
                          children: [
                            TaskCard(
                              isActive: false,
                              isDone: true,
                              taskNumber: "1",
                            ),
                            TaskCard(
                              isActive: true,
                              isDone: false,
                              taskNumber: "2",
                            ),
                            TaskCard(
                              isActive: false,
                              isDone: false,
                              taskNumber: "3",
                            ),
                          ],
                        ),
                      ),

                      // Minimize
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Minimize", style: Styles.captionMedium),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_drop_up),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


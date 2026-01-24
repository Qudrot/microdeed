import 'package:flutter/material.dart';
import 'package:microdeed/animation/circular_timer.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/shadows.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/widgets/InfoBadge.dart';
import 'package:microdeed/widgets/taskcard.dart';
import 'package:microdeed/pages/completion_page.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  bool _isTaskListExpanded = true;

  @override
  void initState() {
    super.initState();
    // Simulate timer finishing after 5 seconds for demo
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CompletionPage()),
        );
      }
    });
  }

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
              // Header info
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
              InfoBadge(
                fillColor: DSColors.tealLight,
                itemColor: DSColors.tealMain,
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
                    border: Border.all(color: DSColors.background, width: 1),
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
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: DSColors.primaryText,
                            ),
                          ),
                        ],
                      ),

                      // Task list
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: Spacers.md),
                          children: const [
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

                      // Minimize button
                      if (!_isTaskListExpanded)
                        TextButton(
                          onPressed: () =>
                              setState(() => _isTaskListExpanded = true),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Minimize", style: Styles.captionMedium),
                              Icon(Icons.arrow_drop_up),
                            ],
                          ),
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

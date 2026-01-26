import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/pages/timer_page.dart';

class InstructionPage extends StatefulWidget {
  const InstructionPage({super.key});

  @override
  State<InstructionPage> createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  bool _canStart = false;
  final List<bool> _stepsDimmed = [false, false, false];

  @override
  void initState() {
    super.initState();
    // 3-second Mental Commitment Gate
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _canStart = true;
        });
      }
    });
  }

  void _toggleStep(int index) {
    setState(() {
      _stepsDimmed[index] = !_stepsDimmed[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Spacers.lg),
                child: Column(
                  children: [
                    const SizedBox(height: Spacers.xl),
                    // Header Icon
                    Container(
                      padding: const EdgeInsets.all(Spacers.lg),
                      decoration: BoxDecoration(
                        color: DSColors.success,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: DSColors.success.withValues(alpha: 0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const _CustomIcon(),
                    ),
                    const SizedBox(height: Spacers.lg),
                    
                    // Title & Subtitle
                    Text(
                      'Sort donated books',
                      style: Styles.headingGeneral.copyWith(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Spacers.xs),
                    Text(
                      'City Library',
                      style: Styles.bodyRegular.copyWith(color: DSColors.success),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Spacers.xl),

                    // Verified Info Card
                    Container(
                      padding: const EdgeInsets.all(Spacers.md),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Spacers.md),
                        border: Border.all(color: DSColors.borders),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'VERIFIED BY VOLUNTEERS',
                            style: Styles.microSmall.copyWith(
                              color: DSColors.purpleMain, 
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: Spacers.sm),
                          Row(
                            children: [
                              const Icon(Icons.timer, color: DSColors.success, size: 28),
                              const SizedBox(width: Spacers.sm),
                              Text(
                                '8 min 42 sec',
                                style: Styles.headingGeneral.copyWith(
                                  color: DSColors.success,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: Spacers.sm),
                          Text(
                            'Average completion time based on 247 successful deeds',
                            style: Styles.microSmall.copyWith(color: DSColors.secondaryText),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Spacers.lg),

                    // Steps Card
                    Container(
                      padding: const EdgeInsets.all(Spacers.md),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Spacers.md),
                        border: Border.all(color: DSColors.borders),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Your 3 Scannable Steps',
                            style: Styles.subheadingStrong,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: Spacers.lg),
                          _buildStepItem(
                            index: 0,
                            number: '1',
                            text: 'Arrive at the Community Center and find the volunteer desk.',
                          ),
                          const SizedBox(height: Spacers.md),
                          _buildStepItem(
                            index: 1,
                            number: '2',
                            text: "Check in with staff, stating you're a 'QuickDeed volunteer'.",
                          ),
                          const SizedBox(height: Spacers.md),
                          _buildStepItem(
                            index: 2,
                            number: '3',
                            text: 'Sort the designated books onto shelves by age group.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(Spacers.lg),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _canStart ? 1.0 : 0.5,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _canStart ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TimerPage()),
                      );
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DSColors.ctaTeal,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: DSColors.inactive, // Grey out
                      padding: const EdgeInsets.symmetric(vertical: Spacers.md),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Spacers.xl),
                      ),
                      textStyle: Styles.bodyRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    child: Text(_canStart ? 'Start 10-Minute Timer' : 'Read instructions... (3s)'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepItem({required int index, required String number, required String text}) {
    final isDimmed = _stepsDimmed[index];
    return GestureDetector(
      onTap: () => _toggleStep(index),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isDimmed ? 0.3 : 1.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: DSColors.success,
              radius: 14,
              child: Text(
                number,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: Spacers.md),
            Expanded(
              child: Text(
                text,
                style: Styles.bodyRegular.copyWith(
                  color: DSColors.primaryText,
                  decoration: isDimmed ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomIcon extends StatelessWidget {
  const _CustomIcon();

  @override
  Widget build(BuildContext context) {
    // Attempting to match the box/upload icon style
    return Stack(
      alignment: Alignment.center,
      children: [
        const Icon(Icons.inventory_2, size: 32, color: Colors.white),
        // Adding a small up arrow if possible or just stick to simple icon
        // Positioned(right: -2, bottom: -2, child: Icon(Icons.arrow_upward, size: 12, color: Colors.white)),
      ],
    );
  }
}

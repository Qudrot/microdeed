import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/widgets/interest_card.dart';
import 'package:microdeed/pages/opportunity_page.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  // Set to store selected interest IDs or Titles
  final Set<String> _selectedInterests = {};

  final List<Map<String, dynamic>> _interests = [
    {
      'title': 'Animal Welfare',
      'subtitle': 'Shelters & rescue',
      'icon': Icons.pets,
    },
    {
      'title': 'Environment',
      'subtitle': 'Parks & cleanup',
      'icon': Icons.forest, // or Icons.park
    },
    {
      'title': 'Health',
      'subtitle': 'Medical support',
      'icon': Icons.favorite,
    },
    {
      'title': 'Education',
      'subtitle': 'Tutoring & mentoring',
      'icon': Icons.school,
    },
    {
      'title': 'Hunger Relief',
      'subtitle': 'Food banks',
      'icon': Icons.restaurant,
    },
    {
      'title': 'Housing',
      'subtitle': 'Shelter support',
      'icon': Icons.home,
    },
  ];

  void _toggleInterest(String title) {
    setState(() {
      if (_selectedInterests.contains(title)) {
        _selectedInterests.remove(title);
      } else {
        _selectedInterests.add(title);
      }
    });
  }

  void _navigateToOpportunity() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OpportunityPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool canContinue = _selectedInterests.isNotEmpty;

    return Scaffold(
      backgroundColor: DSColors.background,
      appBar: AppBar(
        backgroundColor: DSColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DSColors.primaryText),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: _navigateToOpportunity,
            child: Text(
              'Skip',
              style: Styles.bodyRegular.copyWith(
                color: DSColors.tealMain, // Use Primary/Teal color
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Step Indication Line
          // Using a simple Container or LinearProgressIndicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacers.lg),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: DSColors.tealMain,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2, // 1/3 filled
                  child: Container(
                    height: 4,
                    color: DSColors.borders, // Inactive part
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Spacers.sm),
          Text(
            'Step 1 of 3',
            style: Styles.captionMedium.copyWith(color: DSColors.secondaryText),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Spacers.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: Spacers.md),
                  Text(
                    'What causes matter to you?',
                    style: Styles.headingGeneral.copyWith(
                      // fontSize: 24, // Matches styles.dart if already 24
                      color: DSColors.primaryText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacers.sm),
                  Text(
                    'Select all that interest you. We\'ll match you with relevant opportunities.',
                    style: Styles.bodyRegular.copyWith(
                      color: DSColors.secondaryText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacers.xl),

                  // Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: Spacers.md,
                      mainAxisSpacing: Spacers.md,
                      childAspectRatio: 0.85, // Adjust card aspect ratio
                    ),
                    itemCount: _interests.length,
                    itemBuilder: (context, index) {
                      final item = _interests[index];
                      final title = item['title'] as String;
                      final isSelected = _selectedInterests.contains(title);

                      return InterestCard(
                        icon: item['icon'] as IconData,
                        title: title,
                        subtitle: item['subtitle'] as String,
                        isSelected: isSelected,
                        onTap: () => _toggleInterest(title),
                      );
                    },
                  ),
                  
                  const SizedBox(height: Spacers.x2l),
                   Text(
                    'Select at least 1 interest', // Updated based on prompt constraint vs UI text
                    textAlign: TextAlign.center,
                     style: Styles.captionMedium.copyWith(color: DSColors.secondaryText),
                  ),

                  const SizedBox(height: Spacers.md),

                  // Continue Button
                  ElevatedButton(
                    onPressed: canContinue ? _navigateToOpportunity : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DSColors.ctaTeal, // Should valid inactive color be handled automatically? 
                                                         // Usually ElevatedButton handles disabled color.
                                                         // But if we want specific styling we might need to adjust.
                      disabledBackgroundColor: DSColors.inactive,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Spacers.xl),
                      ),
                      textStyle: Styles.bodyRegular.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: Spacers.mmd,
                      ),
                    ),
                    child: const Text('Continue'),
                  ),
                  const SizedBox(height: Spacers.xl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
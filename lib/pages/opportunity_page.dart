import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:microdeed/pages/activity_page.dart';
import 'package:microdeed/pages/impact_page.dart';
import 'package:microdeed/pages/opportunity_detail_page.dart';
import 'package:microdeed/pages/profile_page.dart';
import 'package:microdeed/widgets/map_view.dart' show MapView;
import 'package:microdeed/widgets/opportunity_card.dart';
class OpportunityPage extends StatefulWidget {
  final int initialIndex;
  const OpportunityPage({super.key, this.initialIndex = 0});

  @override
  State<OpportunityPage> createState() => _OpportunityPageState();
}

class _OpportunityPageState extends State<OpportunityPage> {
  bool _showMap = false;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _toggleView(bool showMap) {
    setState(() {
      _showMap = showMap;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    // If not on Discover tab (0), show relevant page.
    // Index 0: Discover (Map/List)
    // Index 1: Activity
    // Index 2: Impact
    // Index 3: Profile (Placeholder)
    
    Widget bodyContent;
    
    switch (_currentIndex) {
      case 1:
        bodyContent = const ActivityPage();
        break;
      case 2:
        bodyContent = const ImpactPage();
        break;
      case 3:
        bodyContent = const ProfilePage();
        break;
      case 0:
      default:
        bodyContent = _buildDiscoverContent();
        break;
    }

    return Scaffold(
      backgroundColor: DSColors.background,
      body: bodyContent,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Impact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: DSColors.ctaTeal,
        unselectedItemColor: DSColors.secondaryText,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  // Refactored existing Discover content into a method
  Widget _buildDiscoverContent() {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Top Bar with conditional background
            Container(
              color: _showMap ? DSColors.surface.withValues(alpha: 0.9) : null,
              padding: const EdgeInsets.all(Spacers.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacers.md,
                      vertical: Spacers.ssm,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: DSColors.borders),
                      borderRadius: BorderRadius.circular(Spacers.sm),
                      color: DSColors.surface,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: DSColors.tealMain,
                          size: Spacers.md,
                        ),
                        const SizedBox(width: Spacers.sm),
                        Text(
                          "Surulere, LG",
                          style: Styles.bodyRegular.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: Spacers.sm),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: DSColors.ctaTeal,
                          size: Spacers.md,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.tune, // Filter icon
                    color: DSColors.ctaTeal,
                    size: Spacers.lg,
                  ),
                ],
              ),
            ),

            if (!_showMap) ...[
              // Header
              Center(
                child: Text(
                  "Opportunities Near You",
                  style: Styles.headingGeneral.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: Spacers.sm),
              Center(
                child: Text(
                  "All tasks are guaranteed 10 minutes or less",
                  style: Styles.bodyRegular.copyWith(
                    color: DSColors.secondaryText,
                  ),
                ),
              ),
              const SizedBox(height: Spacers.lg),
            ],

            // Expanded Layout with Stack for Map/List
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Content Layer
                  AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _showMap
                          ? const MapView()
                          : ListView(
                              padding: const EdgeInsets.only(
                                top: Spacers.x2l, // Make space for the toggle
                                left: Spacers.md,
                                right: Spacers.md,
                                bottom: Spacers.lg,
                              ),
                              children: [
                                OpportunityCard(
                                  duration: "10 MIN",
                                  distance: "0.5 mi away",
                                  title: "Help sort donations at Food Bank",
                                  description:
                                      "Quickly sort canned goods for distribution to local families in need.",
                                  avgCompletionTime: "8 min 42 sec",
                                  location: "Community Center",
                                  dateTime: "Today, 3:00 PM",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const OpportunityDetailPage(),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: Spacers.md),
                                OpportunityCard(
                                  duration: "10 MIN",
                                  distance: "0.8 mi away",
                                  title: "Read to seniors at Willow Creek",
                                  description:
                                      "Spend 10 minutes reading a short story to elderly residents.",
                                  avgCompletionTime: "9 min 15 sec",
                                  location: "Willow Creek Home",
                                  dateTime: "Tomorrow, 10:00 AM",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const OpportunityDetailPage(),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: Spacers.md),
                                OpportunityCard(
                                  duration: "10 MIN",
                                  distance: "0.5 mi away",
                                  title: "Clean up local park trail",
                                  description:
                                      "Pick up litter along the nature trail.",
                                  avgCompletionTime: "9 min 15 sec",
                                  location: "Riverside Park",
                                  dateTime: "Today, 5:00 PM",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const OpportunityDetailPage(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )),

                  // Floating Toggle (Map/List)
                  Positioned(
                    top: _showMap ? Spacers.md : 0, // Adjust position if map
                    child: Container(
                      decoration: BoxDecoration(
                        color: DSColors.surface,
                        borderRadius: BorderRadius.circular(Spacers.sm),
                        border: Border.all(color: DSColors.borders),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => _toggleView(true),
                            child: _ToggleItem(text: "Map", isSelected: _showMap),
                          ),
                          GestureDetector(
                            onTap: () => _toggleView(false),
                            child:
                                _ToggleItem(text: "List", isSelected: !_showMap),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}

class _ToggleItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _ToggleItem({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacers.lg,
        vertical: Spacers.ssm,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? DSColors.surface
            : DSColors.background.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(Spacers.sm),
      ),
      child: Text(
        text,
        style: Styles.captionMedium.copyWith(
          color: isSelected ? DSColors.ctaTeal : DSColors.secondaryText,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}
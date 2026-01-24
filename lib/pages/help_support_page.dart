import 'package:flutter/material.dart';
import 'package:microdeed/design_system/colors.dart';
import 'package:microdeed/design_system/spacers.dart';
import 'package:microdeed/design_system/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({super.key});

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _faqKey = GlobalKey();

  void _scrollToFAQs() {
     Scrollable.ensureVisible(
      _faqKey.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _showSuccessDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacers.lg)),
        child: Padding(
          padding: const EdgeInsets.all(Spacers.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(Spacers.sm),
                decoration: const BoxDecoration(color: DSColors.ctaTeal, shape: BoxShape.circle),
                child: const Icon(Icons.check, color: Colors.white, size: 30),
              ),
              const SizedBox(height: Spacers.lg),
              Text(title, style: Styles.subheadingStrong.copyWith(color: DSColors.ctaTeal)),
               const SizedBox(height: Spacers.sm),
              Text(message, style: Styles.bodyRegular, textAlign: TextAlign.center),
               const SizedBox(height: Spacers.lg),
               SizedBox(
                 width: double.infinity,
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     backgroundColor: DSColors.ctaTeal,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                     padding: const EdgeInsets.symmetric(vertical: 12),
                   ),
                   onPressed: () => Navigator.pop(context),
                   child: const Text("Close", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }

  void _showContactDialog() {
    showDialog(
      context: context,
      builder: (context) => _buildFormDialog(
        title: "Send a Message",
        buttonText: "Send Message",
        fields: [
          _buildTextField("Your Name"),
          _buildTextField("Your Email"),
          _buildDropdown("Select Category"),
          _buildTextField("Your message...", maxLines: 4),
        ],
        onSubmit: () {
          Navigator.pop(context); // Close form
          _showSuccessDialog("Message sent!", "We'll respond within 24 hours.");
        },
      ),
    );
  }

  Future<void> _launchExternal(String scheme, String path) async {
    final Uri uri = Uri(scheme: scheme, path: path);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Fallback or error handling
      debugPrint("Could not launch $uri");
    }
  }

  void _showCommunityDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacers.lg)),
        child: Padding(
          padding: const EdgeInsets.all(Spacers.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Community Forum", style: Styles.headingGeneral.copyWith(fontSize: 22)),
              const SizedBox(height: Spacers.md),
              Text(
                "The community forum helps volunteers connect, share experiences, and ask questions. Would you like to visit the forum?",
                style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Spacers.lg),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DSColors.ctaTeal,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        // Launch forum URL if exists, for now just close
                      },
                      child: const Text("Visit Forum", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: Spacers.md),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        side: const BorderSide(color: Colors.purple),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showReportDialog() {
    showDialog(
      context: context,
      builder: (context) => _buildFormDialog(
        title: "Report an Issue",
        buttonText: "Submit Report",
        fields: [
           _buildTextField("Issue Title"),
           _buildTextField("Your Email"),
           _buildDropdown("Technical Bug"),
           _buildTextField("Describe the issue...", maxLines: 4),
        ],
        onSubmit: () {
          Navigator.pop(context);
           _showSuccessDialog("Report Submitted", "Thank you for helping us improve.");
        }
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacers.md),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(Spacers.sm), borderSide: const BorderSide(color: DSColors.borders)),
          contentPadding: const EdgeInsets.all(Spacers.md),
        ),
      ),
    );
  }

  Widget _buildDropdown(String hint) {
     return Padding(
      padding: const EdgeInsets.only(bottom: Spacers.md),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
           border: OutlineInputBorder(borderRadius: BorderRadius.circular(Spacers.sm), borderSide: const BorderSide(color: DSColors.borders)),
           contentPadding: const EdgeInsets.symmetric(horizontal: Spacers.md, vertical: 12),
        ),
        hint: Text(hint),
        items: const [],
        onChanged: (val) {},
      ),
    );
  }

  Widget _buildFormDialog({
    required String title,
    required String buttonText,
    required List<Widget> fields,
    required VoidCallback onSubmit,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacers.lg)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Spacers.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(title, style: Styles.headingGeneral.copyWith(fontSize: 20)),
               const SizedBox(height: Spacers.lg),
               ...fields,
               const SizedBox(height: Spacers.md),
               Row(
                 children: [
                   Expanded(
                     child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                         backgroundColor: DSColors.ctaTeal,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                         padding: const EdgeInsets.symmetric(vertical: 12),
                       ),
                       onPressed: onSubmit,
                       child: Text(buttonText, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                     ),
                   ),
                   const SizedBox(width: Spacers.md),
                   Expanded(
                     child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                         padding: const EdgeInsets.symmetric(vertical: 12),
                         side: const BorderSide(color: Colors.purple), // Specific color from screenshot? Or adjust
                       ),
                       onPressed: () => Navigator.pop(context),
                       child: const Text("Cancel", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                     ),
                   ),
                 ],
               )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DSColors.primaryText),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Help & Support",
          style: Styles.headingGeneral.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(Spacers.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search for help...",
                prefixIcon: const Icon(Icons.search, color: DSColors.secondaryText),
                filled: true,
                fillColor: const Color(0xFFF9FAFB),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: DSColors.borders),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: DSColors.borders),
                ),
              ),
            ),
            const SizedBox(height: Spacers.xl),

            // Quick Links
            Text("Quick Links", style: Styles.subheadingStrong),
            const SizedBox(height: Spacers.md),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: Spacers.md,
              crossAxisSpacing: Spacers.md,
              childAspectRatio: 1.3,
              children: [
                GestureDetector(onTap: _scrollToFAQs, child: _buildQuickLinkCard(Icons.help, "FAQs", Colors.green[50]!, Colors.green)),
                GestureDetector(onTap: _showContactDialog, child: _buildQuickLinkCard(Icons.email, "Contact Us", Colors.green[50]!, Colors.green)),
                GestureDetector(onTap: _showCommunityDialog, child: _buildQuickLinkCard(Icons.people, "Community", Colors.green[50]!, Colors.green)),
                GestureDetector(onTap: _showReportDialog, child: _buildQuickLinkCard(Icons.flag, "Report", Colors.green[50]!, Colors.green)),
              ],
            ),

            const SizedBox(height: Spacers.xl),

            // Common Questions
            Container(key: _faqKey, child: Text("Common Questions", style: Styles.subheadingStrong)),
            const SizedBox(height: Spacers.md),
            
            _buildExpansionTile(
              "How do I find opportunities near me?",
              "Use the search and filter options on the opportunity feed to discover local volunteering events. You can filter by cause, distance, and time available.",
              isOpen: true,
            ),
            _buildExpansionTile("What if I can't make an event?", "Info about cancellation..."),
            _buildExpansionTile("How do I reset my password?", "Info about password reset..."),
            _buildExpansionTile("How do badges and rewards work?", "Info about badges..."),
            _buildExpansionTile("Can I volunteer with friends?", "Info about friends..."),
            
            const SizedBox(height: Spacers.xl),

            // Need More Help?
            Text("Need More Help?", style: Styles.subheadingStrong),
            const SizedBox(height: Spacers.md),
            _buildHelpItem(Icons.chat_bubble, "Send a Message", "24hr response time", onTap: () => _launchExternal('sms', '')),
            _buildHelpItem(Icons.phone, "Call Support", "(555) 123-4567", onTap: () => _launchExternal('tel', '5551234567')),
             _buildHelpItem(Icons.message, "Live Chat", "Available 9AM-6PM ET", onTap: () => launchUrl(Uri.parse('https://wa.me/'))),

            const SizedBox(height: Spacers.xl),

            // Resources
            Text("Resources", style: Styles.subheadingStrong),
            const SizedBox(height: Spacers.md),
             _buildHelpItem(Icons.book, "Volunteer Guidelines", "", isResource: true),
             _buildHelpItem(Icons.security, "Safety & Conduct", "", isResource: true),
             _buildHelpItem(Icons.lock, "Privacy Policy", "", isResource: true),
             
            const SizedBox(height: Spacers.x3l),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickLinkCard(IconData icon, String label, Color bgColor, Color iconColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Spacers.md),
        border: Border.all(color: DSColors.borders),
        boxShadow: [
           BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE0F2F1), // Light Mint
            child: Icon(icon, color: DSColors.ctaTeal),
          ),
          const SizedBox(height: Spacers.sm),
          Text(label, style: Styles.bodyRegular.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildExpansionTile(String title, String content, {bool isOpen = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacers.md),
      decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(Spacers.md),
         border: Border.all(color: DSColors.borders),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isOpen,
          title: Text(
            title,
            style: Styles.bodyRegular.copyWith(fontWeight: FontWeight.bold),
          ),
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: Spacers.md, vertical: Spacers.sm),
              color: const Color(0xFFF9FAFB), // Slight bg for expanded area
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(content, style: Styles.bodyRegular.copyWith(color: DSColors.secondaryText)),
                  const SizedBox(height: Spacers.md),
                  Row(
                    children: [
                      Text("Was this helpful?", style: Styles.microSmall.copyWith(color: DSColors.secondaryText)),
                      const SizedBox(width: Spacers.md),
                      _buildChip("Yes", Icons.thumb_up),
                      const SizedBox(width: Spacers.sm),
                       _buildChip("No", Icons.thumb_down),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, IconData icon) {
     return Container(
       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: Colors.grey[200],
       ),
       child: Row(
         mainAxisSize: MainAxisSize.min,
         children: [
           Icon(icon, size: 14, color: Colors.grey[700]),
           const SizedBox(width: 4),
           Text(label, style: Styles.microSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.grey[700])),
         ],
       ),
     );
  }
  
  Widget _buildHelpItem(IconData icon, String title, String subtitle, {bool isResource = false, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: Spacers.md),
        padding: const EdgeInsets.all(Spacers.md),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Spacers.lg),
          border: Border.all(color: DSColors.borders),
        ),
        child: Row(
          children: [
             CircleAvatar(
               backgroundColor: const Color(0xFFE0F2F1),
               child: Icon(icon, color: DSColors.ctaTeal, size: 20),
             ),
             const SizedBox(width: Spacers.md),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(title, style: Styles.subheadingStrong),
                   if (subtitle.isNotEmpty)
                    Text(subtitle, style: Styles.captionMedium.copyWith(color: DSColors.secondaryText)),
                 ],
               ),
             ),
             const Icon(Icons.chevron_right, color: DSColors.secondaryText),
          ],
        ),
      ),
    );
  }
}

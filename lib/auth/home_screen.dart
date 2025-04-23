import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Heapware', style: TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.tealAccent),
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            OurExpertiseSection(controller: _controller),
            WhyChooseUsSection(),
            CaseStudiesSection(controller: _controller),
          ],
        ),
      ),
    );
  }
}

// **Drawer for Navigation**
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.tealAccent),
            child: Text(
              'Heapware',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          _buildDrawerItem(context, Icons.home, 'Home', HomeScreen()),
          _buildDrawerItem(context, Icons.work, 'Projects', PlaceholderScreen('Projects')),
          _buildDrawerItem(context, Icons.settings, 'Services', PlaceholderScreen('Services')),
          _buildDrawerItem(context, Icons.info, 'About', PlaceholderScreen('About')),
          _buildDrawerItem(context, Icons.business, 'Career', PlaceholderScreen('Career')),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, IconData icon, String title, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: Colors.tealAccent),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen));
      },
    );
  }
}

// **Our Expertise Section**
class OurExpertiseSection extends StatelessWidget {
  final AnimationController controller;
  OurExpertiseSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Our Expertise', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 1.1, // Adjusted for better spacing
            children: [
              _buildExpertiseCard(Icons.web, 'Web Development', 'Custom Websites & Web Apps.'),
              _buildExpertiseCard(Icons.phone_android, 'Mobile Apps', 'Android & iOS Development.'),
              _buildExpertiseCard(Icons.cloud, 'SAAS Development', 'Cloud-based applications.'),
              _buildExpertiseCard(Icons.business, 'ERP Systems', 'Enterprise resource planning.'),
              _buildExpertiseCard(Icons.search, 'SEO Services', 'Search engine optimization.'),
              _buildExpertiseCard(Icons.trending_up, 'Digital Marketing', 'Social media & ad campaigns.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpertiseCard(IconData icon, String title, String description) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.tealAccent, size: 36),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 6),
            Expanded(
              child: Text(description, style: TextStyle(color: Colors.white70), overflow: TextOverflow.ellipsis, maxLines: 2),
            ),
          ],
        ),
      ),
    );
  }
}

// **Case Studies Section**
class CaseStudiesSection extends StatelessWidget {
  final AnimationController controller;
  CaseStudiesSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Case Studies', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 16),
          _buildAnimatedListTile(Icons.check_circle, 'AI-driven eCommerce Platform', 'Optimized shopping experience with AI.', 0),
          _buildAnimatedListTile(Icons.check_circle, 'Healthcare Data Analysis', 'Helping hospitals with real-time analytics.', 1),
          _buildAnimatedListTile(Icons.check_circle, 'Blockchain for Secure Transactions', 'Securing financial transactions with blockchain.', 2),
        ],
      ),
    );
  }

  Widget _buildAnimatedListTile(IconData icon, String title, String subtitle, int index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, (1 - controller.value) * 50),
          child: AnimatedOpacity(
            opacity: controller.value,
            duration: Duration(milliseconds: 600 + (index * 100)),
            child: ListTile(
              leading: Icon(icon, color: Colors.tealAccent),
              title: Text(title, style: TextStyle(color: Colors.white)),
              subtitle: Text(subtitle, style: TextStyle(color: Colors.white70)),
            ),
          ),
        );
      },
    );
  }
}

// **Header Section**
class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.tealAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Creating a Better IT Solutions.', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
          SizedBox(height: 8),
          Text('Transform your ideas into reality with Heapware.', style: TextStyle(color: Colors.black)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: Text('Get a free consultant call', style: TextStyle(color: Colors.tealAccent)),
          ),
        ],
      ),
    );
  }
}

// **Why Choose Us Section**
class WhyChooseUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.black,
      child: Text('Why Choose Us? Delivering Excellence in IT Services.', style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}

// **Placeholder Screen**
class PlaceholderScreen extends StatelessWidget {
  final String title;
  PlaceholderScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(title, style: TextStyle(color: Colors.tealAccent)), backgroundColor: Colors.black),
      body: Center(child: Text(title, style: TextStyle(color: Colors.white, fontSize: 24))),
    );
  }
}
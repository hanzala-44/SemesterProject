import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<profile> {
  // Sample data for the profile
  String username = "John Doe";
  String userBio = "Content creator | TikTok lover | Traveler";
  String profilePicUrl = "https://randomuser.me/api/portraits/men/1.jpg"; // Replace with actual user's image
  int followers = 1500;
  int following = 120;
  int posts = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture and username
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(profilePicUrl), // User profile picture
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username
                      Text(
                        username,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      // Bio
                      Text(
                        userBio,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Stats (Followers, Following, Posts)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn("Posts", posts),
                _buildStatColumn("Followers", followers),
                _buildStatColumn("Following", following),
              ],
            ),
            SizedBox(height: 20),

            // Buttons (Follow, Message, etc.)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Follow button clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Follow button color
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    "Follow",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Message button clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700], // Message button color
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    "Message",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Posts Grid (Image Posts section)
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: 9, // Placeholder for 9 posts
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://picsum.photos/200/200?random=$index"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build stats column (posts, followers, following)
  Widget _buildStatColumn(String label, int count) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../Data/course.dart'; // Import the data file

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchController = TextEditingController();
  List<CoursePost> _filteredPosts = [];

  @override
  void initState() {
    super.initState();
    _filteredPosts = coursePosts;
    _searchController.addListener(_filterPosts);
  }

  void _filterPosts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPosts = coursePosts.where((post) {
        return post.userName.toLowerCase().contains(query) ||
            post.description.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Courses", textAlign: TextAlign.center),
        centerTitle: true, // 👈 Ensures the title stays centered
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        toolbarHeight: 40,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              // Navigate to cart screen or perform action
              print("Cart tapped");
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // 🔍 Search Field
            TextField(
              controller: _searchController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                hintText: 'Search courses...',
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.search, color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 📄 Course List
            Expanded(
              child: ListView.builder(
                itemCount: _filteredPosts.length,
                itemBuilder: (context, index) {
                  final post = _filteredPosts[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.greenAccent, width: 1.5), // ✅ Border here
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(post.userProfileImage),
                            ),
                            title: Text(post.userName, style: TextStyle(color: Colors.white)),
                            subtitle: Text('Just now', style: TextStyle(color: Colors.white70)),

                            trailing: Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: IconButton(
                                icon: Icon(Icons.more_vert, color: Colors.white),
                                onPressed: () {
                                  // TODO: Show bottom sheet or menu here
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.grey[900],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                    ),
                                    builder: (context) {
                                      return Wrap(
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.share, color: Colors.white),
                                            title: Text("Share", style: TextStyle(color: Colors.white)),
                                            onTap: () {
                                              Navigator.pop(context);
                                              // Add share logic here
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.report, color: Colors.white),
                                            title: Text("Report", style: TextStyle(color: Colors.white)),
                                            onTap: () {
                                              Navigator.pop(context);
                                              // Add report logic here
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(post.description, style: TextStyle(color: Colors.white)),),

                          SizedBox(height: 10),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: post.courseImages.length,
                              itemBuilder: (context, imgIndex) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      post.courseImages[imgIndex],
                                      fit: BoxFit.cover,
                                      width: 300,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Icon(Icons.thumb_up, color: Colors.white70, size: 20),
                                SizedBox(width: 6),
                                Text('${post.likes} Likes', style: TextStyle(color: Colors.white70)),
                                Spacer(),
                                Icon(Icons.comment, color: Colors.white70, size: 20),
                                SizedBox(width: 6),
                                Text('${post.comments} Comments', style: TextStyle(color: Colors.white70)),
                              ],
                            ),
                          ),
                        ],
                      ),
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
}

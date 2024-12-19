import 'package:flutter/material.dart';
import 'package:social_app/utility/app_assets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("SOCIALLY",style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Visibility(
          visible: false,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProfileHeader(),
            _buildProfileContent(screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(AppAssets.user7),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Alex Strohl',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                   onPressed: (){},
                  ),
                  Text('Explore', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildPostGrid(screenWidth),
        ],
      ),
    );
  }

  Widget _buildPostGrid(double screenWidth) {
    // Replace with your own post images
    final List<String> postImages = [
      'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
      'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60',
      'https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60',
      'https://images.unsplash.com/photo-1560972582-16812ca15bb4?crop=entropy&cs=tinysrgb&fit=max&ixid=MXwyMDg0NHwwfDF8c2VhcmNofDJ8fGJhbmFuYWF8ZW58MHx8fHw%3D&w=1080&h=1080&fit=crop&ixlib=rb-1.2.1&s=b67d96fd618ec788a9ab9b034a422b8',
      'https://images.unsplash.com/photo-1502767089025-6572583495b3?ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60',
    ];

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0,
      ),
      itemCount: postImages.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(postImages[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

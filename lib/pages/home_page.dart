import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/components/social_post.dart';
import 'package:social_app/utility/app_assets.dart';
import 'package:social_app/utility/app_colors.dart';

import '../components/userIcon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<String> profileImages=[AppAssets.user1,AppAssets.user2,AppAssets.user3,AppAssets.user4,AppAssets.user5,AppAssets.user6,AppAssets.user7];
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kMainColor,
        appBar: AppBar(
          backgroundColor: AppColors.kMainColor,
          title: const Center(
            child: Text(
              "SOCIALLY",
              style: TextStyle(color: Colors.white),
            ),
          ),
          leading: IconButton(
            onPressed: signOut,
            icon: const Icon(
              color: Colors.white,
              Icons.notifications,
            ),
          ),
          actions: [
            IconButton(
              onPressed: signOut,
              icon: const Icon(
                color: Colors.white,
                Icons.logout,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  width: screenWidth*0.8,
                  height: screenWidth*0.2,
                  decoration: BoxDecoration(
                    color: AppColors.kSecondColor,
                    borderRadius: BorderRadius.circular(50), // Adjust this value to make it more rounded
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                          child: CircularProfileImage(
                            imagePath: profileImages[index],
                            borderColor: Colors.white,
                            width: screenWidth * 0.15,
                            height: screenWidth * 0.15,
                          ),
                        );
                      }
                  ),
                ),
                SocialPost(
                  userImage: AppAssets.kylie,
                  userName: 'Kylie Jenner',
                  date: '2 d ago',
                  postImage: null,
                  description: "Stopped by @zoesugg today with goosey girl to see @kyliecosmetics & @kylieskin 💕 wow what a dream!!!!!!!! It’s the best experience we have!",
                  likes: "1,320",
                  comments: "23",
                  onLikePressed: () {
                    // Handle like button press
                  },
                  onCommentPressed: () {
                    // Handle comment button press
                  },
                  onSavePressed: () {
                    // Handle save button press
                  },
                ),
                SocialPost(
                  userImage: AppAssets.user7,
                  userName: 'Kylie Jenner',
                  date: '1 w ago',
                  postImage: AppAssets.post,
                  description: "This is one of the best experiences that I’ve ever had in my life! the mountain view here is emazing.",
                  likes: "1,540",
                  comments: "176",
                  onLikePressed: () {
                    // Handle like button press
                  },
                  onCommentPressed: () {
                    // Handle comment button press
                  },
                  onSavePressed: () {
                    // Handle save button press
                  },
                ),
                SizedBox(height: screenHeight*0.01,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

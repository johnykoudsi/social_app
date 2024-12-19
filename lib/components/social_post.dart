import 'package:flutter/material.dart';

class SocialPost extends StatelessWidget {
  final String userImage;
  final String userName;
  final String date;
  final String? postImage;
  final String description;
  final String likes;
  final String comments;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSavePressed;

  const SocialPost({
    Key? key,
    required this.userImage,
    required this.userName,
    required this.date,
    this.postImage,
    required this.description,
    required this.likes,
    required this.comments,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onSavePressed,
  }) : super(key: key);

  List<TextSpan> _buildDescriptionTextSpans(String text) {
    final RegExp regex = RegExp(r'(@\w+)');
    final List<TextSpan> spans = [];
    text.splitMapJoin(
      regex,
      onMatch: (Match match) {
        spans.add(TextSpan(
          text: match.group(0),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ));
        return '';
      },
      onNonMatch: (String nonMatch) {
        spans.add(TextSpan(
          text: nonMatch,
          style: const TextStyle(
            color: Colors.black,
          ),
        ));
        return '';
      },
    );
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(userImage),
                  radius: 25.0,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0, // Increased font size for the user name
                      color: Colors.black, // Set username color to black
                    ),
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            if (postImage != null)
              Image.asset(
                postImage!,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 10.0),
            RichText(
              text: TextSpan(
                children: _buildDescriptionTextSpans(description),
                style: const TextStyle(
                  fontSize: 16.0, // Increased font size for the description
                  height: 1.6, // Increased line height for better spacing between lines
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: onLikePressed,
                    ),
                    Text(
                      '$likes',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.comment),
                      onPressed: onCommentPressed,
                    ),
                    Text(
                      '$comments',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: onSavePressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

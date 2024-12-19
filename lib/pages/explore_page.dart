import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_app/components/bottom_nav_bar.dart';
import 'package:social_app/components/progress_bar.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

double percentageWatched = 0;

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    _startWatching();
    super.initState();
  }
  @override
  void dispose() {
    percentageWatched=0;

    super.dispose();
  }
  void _startWatching() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        if (percentageWatched + 0.01 < 1) {
          percentageWatched += 0.01;
        } else {
          percentageWatched = 1;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BottomNavBar.of(context)?.toggleNavBarVisibility();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            ProgressBar(percent: percentageWatched),
          ],
        ),
      ),
    );
  }
}

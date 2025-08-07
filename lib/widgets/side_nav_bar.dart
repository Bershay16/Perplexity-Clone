// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/side_bar_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: isCollapsed ? 66 : 150,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 20,
            ),
            child: Icon(
              Icons.auto_awesome_mosaic,
              size: isCollapsed ? 30 : 60,
              color: AppColors.whiteColor,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isCollapsed ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                SideBarButtoon(isCollapsed: isCollapsed, icon: Icons.add, text: "Home"),
                const SizedBox(height: 24),
                SideBarButtoon(isCollapsed: isCollapsed, icon:Icons.search, text: "Search"),
                const SizedBox(height: 24),
                SideBarButtoon(isCollapsed: isCollapsed, icon:Icons.language, text: "World"),
                const SizedBox(height: 24),
                SideBarButtoon(isCollapsed: isCollapsed, icon:Icons.auto_awesome, text: "Discover"),
                const SizedBox(height: 24),
                SideBarButtoon(isCollapsed: isCollapsed, icon:Icons.cloud_outlined, text: "Library"),
                const Spacer(),
              ],
            ),
          ),
          GestureDetector(
                  onTap: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 22,
                    ),
                    child: Icon(
                      isCollapsed
                          ? Icons.keyboard_arrow_right
                          : Icons.keyboard_arrow_left,
                      color: AppColors.iconGrey,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
        ],
      ),
    );
  }
}

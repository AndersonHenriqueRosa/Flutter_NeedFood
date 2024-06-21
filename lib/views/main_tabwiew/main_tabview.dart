
import 'package:flutter/material.dart';
import 'package:need_food/common/my_colors.dart';
import 'package:need_food/common_widget/tab_button.dart';
import 'package:need_food/views/home/home_view.dart';
import 'package:need_food/views/profile/profile.dart';



class MainTabView extends StatefulWidget {
  const MainTabView({super.key});
  
  @override
  State<MainTabView> createState() => _MainTabViewSatate();
}

class _MainTabViewSatate extends State<MainTabView> {

  int selectTab = 0;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPageView = const HomeView();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectPageView),
      backgroundColor:   Colors.white10,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            if (selectTab != 2) {
              selectTab = 2;
              selectPageView = Container();
            }
            if(mounted) {
              setState(() {
                
              });
            }
          },
          shape: const CircleBorder(),
          backgroundColor: selectTab == 2 ? MyColors.buttonColor : Color.fromARGB(255, 238, 233, 233),
          child: Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/icon/shopping-cart.png",
              width: 30,
              height: 30,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 1,
        notchMargin: 12,
        height: 64,
        shape: const CircularNotchedRectangle(),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                title: "Home",
                icon: "assets/icon/home.png", 
                onTap: () {
                  if (selectTab != 0) {
                    selectTab = 0;
                    selectPageView = HomeView();
                  }
                  if(mounted) {
                    setState(() {});
              }
                }, 
                isSelected: selectTab == 0),
          
              TabButton(
                title: "Wishlist",
                icon: "assets/icon/heart.png", 
                onTap: () {
                  if (selectTab != 1) {
                    selectTab = 1;
                    selectPageView = Container();
                  }
                  if(mounted) {
                    setState(() {});
                  }
                }, 
                isSelected: selectTab == 1),
          
                const SizedBox(width: 40, height: 40,),
          
              TabButton(
                title: "Feedback",
                icon: "assets/icon/chat.png", 
                onTap: () {
                  if (selectTab != 3) {
                    selectTab = 3;
                    selectPageView = Container();
                  }
                  if(mounted) {
                    setState(() {});
                  }
                }, 
                isSelected: selectTab == 3),
          
              TabButton(
                title: "Profile",
                icon: "assets/icon/user.png", 
                onTap: () {
                  if (selectTab != 4) {
                    selectTab = 4;
                    selectPageView = ProfileView();
                  }
                  if(mounted) {
                    setState(() {});
                  }
                }, 
                isSelected: selectTab == 4),  
              
            ],
          ),
        ),
      
      ),
    );
  }
}
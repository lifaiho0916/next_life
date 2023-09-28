// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/pages.dart';
import 'package:next_life/constants.dart';
import 'package:next_life/presentation/pages/drawer.dart';
import 'package:next_life/presentation/pages/my_life/my_life_profile_page.dart';
import 'package:next_life/presentation/pages/my_life/my_next_life_profile_page.dart';
import 'package:next_life/presentation/pages/my_life/the_path_profile_page.dart';
import 'package:next_life/presentation/pages/path_finder/path_personalized_plan_page.dart';
import 'package:next_life/data/init_data.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  // int? _selectedProfileIdx;
  late List<int> _pageHistory;
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();
  late final ExpandableController _expandableController;
  late String greeting;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageHistory = [0];
    _expandableController = ExpandableController(initialExpanded: true);
    greeting = 'Welcome ${sendData.userName}';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final themeMode = sendData.theme;
      return Scaffold(
        drawer: const DrawerWidget(),
        key: scaffoldKey,
        // backgroundColor: const Color(0xffe5f0ee),
        backgroundColor: themeMode == 0
            ? lightTheme.colorScheme.background
            : darkTheme.colorScheme.background,
        appBar: buildAppBar(),
        body: Column(
          children: <Widget>[
            ExpandableNotifier(
              controller: _expandableController,
              child: Expandable(
                collapsed: const SizedBox.shrink(),
                // expanded: SizedBox(),
                expanded: buildHeaderSection(),
                theme: const ExpandableThemeData(
                  animationDuration: Duration(milliseconds: 500),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  HomePage(onGoToPage: goToPage),
                  SettingPage(onGoToPage: goToPage),
                  AccountPage(onGoToPage: goToPage),
                  DobPage(onGoToPage: goToPage),
                  UsernamePage(onGoToPage: goToPage),
                  GenderPage(onGoToPage: goToPage),
                  PasswordPage(onGoToPage: goToPage),
                  AppearancePage(onGoToPage: goToPage),
                  HelpSupportPage(onGoToPage: goToPage),
                  PathFinderPage(onGoToPage: goToPage),
                  YourAnswerPage(onGoToPage: goToPage),
                  PathFinderReportPage(onGoToPage: goToPage),
                  DetailPathInfoPage(onGoToPage: goToPage),
                  PathSettingPage(onGoToPage: goToPage),
                  PathPersonalizedPlanPage(onGoToPage: goToPage),
                  MyNextLifeProfilePage(onGoToPage: goToPage),
                  ThePathProfilePage(onGoToPage: goToPage),
                  MyLifeProfilePage(onGoToPage: goToPage),
                ],
                onPageChanged: (value) {
                  _currentPageIndex = value;
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF237A6A),
      leading: buildLeading(),
      title: buildTitle(),
      actions: buildActions(),
      titleSpacing: 8,
    );
  }

  Widget buildHeaderSection() {
    return Container(
      color: const Color(0xFF237A6A),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    );
  }

  Widget? buildLeading() {
    bool flag;
    flag = sendData.curAvatarImage == "" ? false : File(sendData.curAvatarImage).existsSync() ? true : false;
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 5),
      child: GestureDetector(
        onTap: () {
          // scaffoldKey.currentState?.openDrawer();
          goToPage(1);
        },
        child: !flag ? const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
                backgroundImage: AssetImage('assets/meta/avatar.jpg')
            ):
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 45,
              backgroundImage: FileImage(File(sendData.curAvatarImage)) 
            ),
      ),
    );
  }

  Widget buildTitle() {
    greeting = 'Welcome ${sendData.userName}';
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Text(
        greeting,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }

  List<Widget> buildActions() {
    return [
      GestureDetector(
        onTap: () async {
          // _expandableController.toggle();
          goToPage(0);
        },
        child: Container(
          margin: const EdgeInsets.only(right: 5.0, top: 10.0),
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF7EBEB2),
            shape: BoxShape.rectangle,
            border: Border.all(color: const Color(0xFF7EBEB2)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () async {
          final result = await Amplify.Auth.signOut();
          if (result is CognitoCompleteSignOut) {
            userId = '';
            sendData.init();
            Navigator.pushNamed(context, "/login");  
            Fluttertoast.showToast(
              msg: 'Sign out completed successfully.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
          } else if (result is CognitoFailedSignOut) {
            Fluttertoast.showToast(
              msg: 'Signout Error.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.only(right: 15.0, top: 10.0),
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF7EBEB2),
            shape: BoxShape.rectangle,
            border: Border.all(color: const Color(0xFF7EBEB2)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    ];
  }

  bool goToPage(int pageIdx) {
    if (pageIdx >= 0 && pageIdx != _currentPageIndex) {
      _pageHistory.add(pageIdx);
      _pageController.animateToPage(
        pageIdx,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
      return false;
    } else if (_pageHistory.length > 1 && pageIdx < 0) {
      _pageHistory.removeLast();
      goToPage(_pageHistory.last);
      _pageHistory.removeLast();
      return false;
    }
    return true;
  }
}

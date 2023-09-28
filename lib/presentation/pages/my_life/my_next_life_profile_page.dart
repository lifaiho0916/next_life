import 'package:flutter/material.dart';
import 'package:next_life/pages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNextLifeProfilePage extends StatefulWidget {
  const MyNextLifeProfilePage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;

  @override
  State<MyNextLifeProfilePage> createState() => _MyNextLifeProfilePageState();
}

class _MyNextLifeProfilePageState extends State<MyNextLifeProfilePage> {
  final PageController _subPageController = PageController();
  List<String> items = [
    'Personal information',
    'Living situation',
    'Education category',
    'Employment category',
    'Financial Category',
    'Personal information',
    'Living situation',
    'Education category',
    'Employment category',
    'Financial Category',
  ];
  int _activeItemIdx = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return WillPopScope(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              SizedBox(
                child: Text(
                  "Welcome to your NextLife. The Path to your best Life awaits",
                  style: GoogleFonts.jotiOne(
                    fontSize: 23,
                    color: const Color.fromRGBO(41, 137, 119, 1),
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 10),
                height: 57,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: const Color(0xFF84C1B6),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Selected path',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 148,
                      height: 37,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5F0EE),
                        shape: BoxShape.rectangle,
                        border: null,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Computer scientist',
                        style: TextStyle(
                          color: Color(0xFF237A6A),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buildCategoryItems(textColor),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: PageView(
                  controller: _subPageController,
                  onPageChanged: (page) {
                    setState(() {
                      _activeItemIdx = page;
                    });
                  },
                  children: const [
                    PersonalInfoPage(),
                    LivingSituationPage(),
                    EducationCategoryPage(),
                    EmploymentCategoryPage(),
                    FinancialCategoryPage(),
                    PersonalInfoNextLifePage(),
                    LivingSituationNextLifePage(),
                    EducationCategoryNextLifePage(),
                    EmploymentCategoryNextLifePage(),
                    FinancialCategoryNextLifePage(),
                  ],
                ),
              ),
            ],
          ),
        ),
        onWillPop: () async {
          return widget.onGoToPage(-1);
        },
      );
    });
  }

  List<Widget> buildCategoryItems(Color textColor) {
    return List<Widget>.generate(
      items.length,
      (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _activeItemIdx = index;
            });
            goToSubPage(index);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: _activeItemIdx == index
                  ? const Color(0xFF237A6A)
                  : Colors.white,
              shape: BoxShape.rectangle,
              border: Border.all(
                color: const Color(0xFF7EBEB2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              items[index],
              style: TextStyle(
                color: _activeItemIdx == index
                    ? Colors.white
                    : textColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }

  void goToSubPage(int subPageIdx) {
    _subPageController.animateToPage(
      subPageIdx,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}

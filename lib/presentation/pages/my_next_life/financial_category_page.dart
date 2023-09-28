import 'package:flutter/material.dart';
import 'package:next_life/pages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/constants.dart';

class FinancialCategoryNextLifePage extends StatefulWidget {
  const FinancialCategoryNextLifePage({Key? key}) : super(key: key);

  @override
  State<FinancialCategoryNextLifePage> createState() => _FinancialCategoryNextLifePageState();
}

class _FinancialCategoryNextLifePageState extends State<FinancialCategoryNextLifePage> {
  @override
  Widget build(BuildContext context) {
    return buildFinancialCategory();
  }

  Widget buildFinancialCategory() {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: 270,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.rectangle,
                border: Border.all(color: const Color(0xFFBDDED8)),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (context) => const MonthlyIncomeDialogPage(),
                        );
                      }
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF237A6A),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: const Color(0xFF7EBEB2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Monthly Income',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (
                              context) => const MonthlyExpenseDialogPage(),
                        );
                      }
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF237A6A),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: const Color(0xFF7EBEB2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Monthly Expense',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (context) => const TotalDebtDialogPage(),
                        );
                      }
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF237A6A),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: const Color(0xFF7EBEB2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Total Debt',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

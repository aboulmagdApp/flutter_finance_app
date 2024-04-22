import 'package:finance_app/screens/add_screen.dart';
import 'package:finance_app/screens/home.dart';
import 'package:finance_app/screens/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuBottom extends StatefulWidget {
  const MenuBottom({super.key});

  @override
  State<MenuBottom> createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  int indexColor = 0;
  List screens = [
    const Home(),
    const Statistics(),
    const Home(),
    const Statistics()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexColor],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddScreen()));
        },
        backgroundColor: const Color(0xff368983),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColor = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color:
                      indexColor == 0 ? const Color(0xff368983) : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColor = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 30,
                  color:
                      indexColor == 1 ? const Color(0xff368983) : Colors.grey,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColor = 2;
                  });
                },
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 30,
                  color:
                      indexColor == 2 ? const Color(0xff368983) : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColor = 3;
                  });
                },
                child: Icon(
                  Icons.person_outlined,
                  size: 30,
                  color:
                      indexColor == 3 ? const Color(0xff368983) : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

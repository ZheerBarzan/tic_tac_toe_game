import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool turn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _onTap(index);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade700)),
                child: Center(
                  child: Text(
                    displayXO[index],
                    style: const TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _onTap(int index) {
    setState(
      () {
        if (turn) {
          displayXO[index] = 'o';
        } else {
          displayXO[index] = "x";
        }
        turn = !turn;
        checkWinner();
      },
    );
  }

  void checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      showWinDialog();
    }
  }

  void showWinDialog() {}
}

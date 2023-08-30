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
  //012
  //345
  //678

  void checkWinner() {
    // checks the first row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      showWinDialog(displayXO[0]);
    }
    //checks the first column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      showWinDialog(displayXO[0]);
    }
    //check diagonal one
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      showWinDialog(displayXO[0]);
    }

    ///check second column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      showWinDialog(displayXO[1]);
    }
    //checks the third column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      showWinDialog(displayXO[2]);
    }
    //checks the second diagonal
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      showWinDialog(displayXO[2]);
    }
    // checks the second row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      showWinDialog(displayXO[3]);
    }
    //checks the third row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      showWinDialog(displayXO[6]);
    }
  }

  void showWinDialog(String Winner) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Column(
              children: [
                Text('${Winner} is the Winner✌️😎'),
                ElevatedButton(onPressed: resetGame, child: Text("reset"))
              ],
            ),
          );
        }));
  }

  void resetGame() {
    setState(() {
      displayXO[displayXO.length] = '';
    });
  }
}

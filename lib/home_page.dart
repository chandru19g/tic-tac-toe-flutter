import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //! Link up Images
  AssetImage cross = const AssetImage('images/cross.png');
  AssetImage circle = const AssetImage('images/circle.png');
  AssetImage edit = const AssetImage('images/edit.png');

  bool isCross = true;
  late String message;
  late List<String> gameState;

  //! Initialise the state of box with empty
  @override
  void initState() {
    super.initState();

    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      message = "";
    });
  }

  //! Play game method
  playGame(int index) {
    if (gameState[index] == 'empty') {
      setState(() {
        if (isCross) {
          gameState[index] = "cross";
        } else {
          gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  //! Reset game method
  resetGame() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        gameState = [
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
        ];
        message = "";
      });
    });
  }

  //! get image method
  getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
      case ('cross'):
        return cross;
      case ('circle'):
        return circle;
    }
  }

  //! Check Win
  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        message = '${gameState[0]} Wins';
        resetGame();
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        message = '${gameState[3]} Wins';
        resetGame();
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        message = '${gameState[6]} Wins';
        resetGame();
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        message = '${gameState[0]} Wins';
        resetGame();
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        message = '${gameState[1]} Wins';
        resetGame();
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        message = '${gameState[2]} Wins';
        resetGame();
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        message = '${gameState[0]} Wins';
        resetGame();
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        message = '${gameState[2]} Wins';
        resetGame();
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        message = 'Game Draw';
        resetGame();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: gameState.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  color: Colors.white,
                  onPressed: () {
                    playGame(i);
                  },
                  child: Image(
                    image: getImage(gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              message.toUpperCase(),
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              onPressed: () {
                resetGame();
              },
              color: Colors.teal,
              minWidth: 300.0,
              height: 50.0,
              child: const Text(
                "Reset Game",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

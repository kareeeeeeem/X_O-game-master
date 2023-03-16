import 'package:flutter/material.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tic Tac Toe'),
        ),
        body: Center(
          child: GameBoard(),
        ),
      ),
    );
  }
}

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final List<String> _board = List.generate(9, (index) => '');
  String _currentPlayer = 'X';

  void _onTap(int index) {
    setState(() {
      if (_board[index] == '') {
        _board[index] = _currentPlayer;
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      }
    });
  }

  void _resetGame() {
    setState(() {
      _board.fillRange(0, 9, '');
      _currentPlayer = 'X';
    });
  }

  Widget _buildSquare(int index) {
    return GestureDetector(
      onTap: () => _onTap(index),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(
          child: Text(
            _board[index],
            style: TextStyle(fontSize: 48),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildSquare(0),
            _buildSquare(1),
            _buildSquare(2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildSquare(3),
            _buildSquare(4),
            _buildSquare(5),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildSquare(6),
            _buildSquare(7),
            _buildSquare(8),
          ],
        ),
        SizedBox(height: 20),
        RaisedButton(
          onPressed: _resetGame,
          child: Text('Reset Game'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _pessoas = 0;
  String _texto = "Pode Entrar!";

  void _mudaPessoas(int delta){
    setState(() {
      _pessoas += delta;
      if(_pessoas<0){
        _texto="Erro";
      }else if(_pessoas <= 10){
        _texto="Pode Entrar!";
      }else {
        _texto="Lotado.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/fundo.jpg",fit: BoxFit.cover,
          height: 1000.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_pessoas",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1", style: TextStyle(fontSize: 40.0, color: Colors.white),),
                    onPressed: (){_mudaPessoas(1);},),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1", style: TextStyle(fontSize: 40.0, color: Colors.white),),
                    onPressed: (){_mudaPessoas(-1);},),
                ),

              ],
            ),
            Text(
              "$_texto",
              style: TextStyle(color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}

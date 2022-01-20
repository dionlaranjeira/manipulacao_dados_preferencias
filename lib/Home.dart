import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _textoExibido = "";

  TextEditingController _controller = TextEditingController();

  Future<void> _salvar() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("dados", _controller.text);

  }

  Future<void> _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textoExibido = prefs.getString("dados") ?? "";
    });
  }

  Future<void> _deletar() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("dados");
    setState(() {
      _textoExibido = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    _recuperar();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manipulação de dados"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(

          children: [
             Center(
              child: Text(
                _textoExibido,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Digite algo",
              ),
              controller: _controller,
            ),
            Padding(padding: const EdgeInsets.all(8),child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _salvar, child: const Text("SALVAR")),
                ElevatedButton(onPressed: _recuperar, child: const Text("RECUPERAR")),
                ElevatedButton(onPressed: _deletar, child: const Text("DELETAR")),
              ],
            ),)
          ],
        ),
      ),

    );
  }
}

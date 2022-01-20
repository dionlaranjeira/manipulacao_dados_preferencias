import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controller = TextEditingController();

  void _salvar(){
    print(_controller.text);
  }

  void _ler(){
    print("Método ler chamado");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manipulação de dados"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(

          children: [
            const Center(
              child: Text(
                "Nada salvo",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Digite algo",
              ),
              controller: _controller,
            ),
            Padding(padding: const EdgeInsets.all(32),child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _salvar, child: const Text("SALVAR")),
                ElevatedButton(onPressed: _ler, child: const Text("LER")),
              ],
            ),)
          ],
        ),
      ),

    );
  }
}

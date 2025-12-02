import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Calculadora());
}

class Calculadora extends StatefulWidget {
  Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final List<double> numbers = [];
  double? resultado;

  double somarValores() {
    double soma = 0;
    for (double item in numbers) {
      soma += item;
    }
    print(soma);
    return soma;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculadora"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              //keyboardType: TextInputType.number,
              //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSubmitted: (value) {
                setState(() {
                  final double? parsed = double.tryParse(value);
                  if (parsed != null) {
                    numbers.add(parsed);
                  } else {
                    print("Não é um número oh mabeco");
                  }
                });
              },
              decoration: const InputDecoration(hintText: 'Escreva o número'),
            ),
            if (resultado != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Resultado: $resultado",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              resultado = somarValores();
              numbers.clear();
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: "XXX"),
          ],
        ),
      ),
    );
  }
}



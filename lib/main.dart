import 'package:flutter/material.dart';

void main() {
  runApp(const ListaAfazeres());
}

class ListaAfazeres extends StatefulWidget {
  const ListaAfazeres({super.key});

  @override
  State<ListaAfazeres> createState() => _ListaAfazeresState();
}

class _ListaAfazeresState extends State<ListaAfazeres> {
  List<Tarefa> tarefas = [];
  TextEditingController controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Afazeres Tunadíssima Turbo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Afazeres'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    value: tarefas[index].status,
                    onChanged: (bool? novoValor) {
                      setState(() {
                        tarefas[index].status = novoValor!;
                      });
                    },
                    title: Text(tarefas[index].titulo),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Descrição',
                        border: OutlineInputBorder(),
                      ),
                      controller: controlador,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (controlador.text.isNotEmpty) {
                          setState(() {
                            tarefas.add(Tarefa(
                                titulo: controlador.text, status: false));
                            controlador.clear();
                          });
                        }
                      },
                      child: const Text('Adicionar'),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Tarefa {
  final String titulo;
  bool status;

  Tarefa({required this.titulo, required this.status});
}

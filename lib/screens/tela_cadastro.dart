import 'package:atv2_avaliativa/main.dart';
import 'package:atv2_avaliativa/models/item.dart';
import 'package:flutter/material.dart';

var nomeController = TextEditingController();
var descricaoController = TextEditingController();
var precoController = TextEditingController();
var imagemUrlController = TextEditingController();

clearControllers() {
  nomeController.clear();
  descricaoController.clear();
  precoController.clear();
  imagemUrlController.clear();
}

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Itens')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 40),
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
                alignLabelWithHint: true,
              ),
              minLines: 10,
              maxLines: 10,
            ),
            SizedBox(height: 12),
            TextField(
              controller: precoController,
              decoration: InputDecoration(
                labelText: 'Preço',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: imagemUrlController,
              decoration: InputDecoration(
                labelText: 'URL da Imagem',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),

            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (nomeController.text.isEmpty ||
                        descricaoController.text.isEmpty ||
                        precoController.text.isEmpty ||
                        imagemUrlController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Por favor, preencha todos os campos'),
                        ),
                      );
                      return;
                    }

                    var itemCadastro = Item(
                      nome: nomeController.text,
                      descricao: descricaoController.text,
                      preco: double.tryParse(precoController.text) ?? 0.0,
                      imagemUrl: imagemUrlController.text,
                    );

                    allitems.add(itemCadastro);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Item cadastrado com sucesso!')),
                    );

                    clearControllers();

                    Navigator.of(context).pop();
                  },
                  child: const Text('Cadastrar'),
                ),
                TextButton(
                  onPressed: () {
                    clearControllers();

                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cadastro cancelado')),
                    );
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

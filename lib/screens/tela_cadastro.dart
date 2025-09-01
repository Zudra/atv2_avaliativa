import 'package:flutter/material.dart';

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Itens'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(labelText: 'Nome', filled: true, fillColor: Colors.grey[200], border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none), contentPadding: const EdgeInsets.all(16)),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(labelText: 'Descrição', filled: true, fillColor: Colors.grey[200], border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none), contentPadding: const EdgeInsets.all(16), alignLabelWithHint: true,),
              minLines: 10,
              maxLines: 10,
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(labelText: 'Preço', filled: true, fillColor: Colors.grey[200], border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none), contentPadding: const EdgeInsets.all(16)),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(labelText: 'URL da Imagem', filled: true, fillColor: Colors.grey[200], border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none), contentPadding: const EdgeInsets.all(16)),
            ),

            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                      

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Item cadastrado com sucesso!')),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cadastrar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cadastro cancelado')),
                    );
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Item {
  String? nome;
  String? descricao;
  double? preco;
  String? imagemUrl;

  Item({this.nome, this.descricao, this.preco, this.imagemUrl});
}
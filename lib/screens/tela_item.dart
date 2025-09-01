import 'package:flutter/material.dart';
import 'package:atv2_avaliativa/models/item.dart';
import 'package:atv2_avaliativa/main.dart';

class TelaItem extends StatelessWidget {
  final Item item;

  const TelaItem({
    super.key,
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.network(item.imagemUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                Text(item.nome)
              ],
            ),
            SizedBox(height: 16),
            Text(
              item.descricao,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '\$${item.preco.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cartItems.add(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.nome} adicionado ao carrinho')),
                    );
                  },
                  child: Text('Adicionar ao Carrinho'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Voltar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
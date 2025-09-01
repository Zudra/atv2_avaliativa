import 'package:flutter/material.dart';
import 'package:atv2_avaliativa/main.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({super.key});

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  Map itemMap = {};

  @override
  void initState() {
    super.initState();
    _atualizaMapa();
  }

  void _atualizaMapa() {
    itemMap = {};
    for (var item in cartItems) {
      if (itemMap.containsKey(item)) {
        itemMap[item] += 1;
      } else {
        itemMap[item] = 1;
      }
    }
  }

  void _addItem(item) {
    setState(() {
      cartItems.add(item);
      _atualizaMapa();
    });
  }

  void _removeItem(item) {
    setState(() {
      cartItems.remove(item);
      _atualizaMapa();
    });
  }

  double get total {
    double t = 0.0;
    itemMap.forEach((item, qtd) {
      t += item.preco * qtd;
    });
    return t;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carrinho')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itemMap.length,
              itemBuilder: (context, index) {
                final item = itemMap.keys.elementAt(index);
                final qtd = itemMap[item];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        item.imagemUrl,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.nome,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'R\$ ${item.preco.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (qtd > 1) {
                                _removeItem(item);
                              } else {
                                _removeItem(item);
                              }
                            },
                          ),
                          Text('$qtd', style: TextStyle(fontSize: 16)),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              _addItem(item);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'R\$ ${total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/pagamento');
                    },
                    child: Text('Confirmar'),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

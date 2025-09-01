import 'package:atv2_avaliativa/screens/tela_cadastro.dart';
import 'package:atv2_avaliativa/screens/tela_carrinho.dart';
import 'package:flutter/material.dart';

List<Item> allitems = [];
List<Item> cartItems = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 82, 82, 82)),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader( 
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/9919?s=200&v=4'),
                  ),
                  SizedBox(height: 10),
                  Text('Menu', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: const Text('Cadastro de Itens'),
              onTap: () async {
                Navigator.pop(context);
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaCadastro()),
                );
                refresh();
              },
            ),

            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: const Text('Carrinho'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaCarrinho()),
                );
              },
            ),
          ],

        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: allitems.length,
        itemBuilder: (context, index) {
          final item = allitems[index];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(item.name),
                Text('\$${item.price.toStringAsFixed(2)}'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cartItems.add(item);
                    });
                  },
                  child: Text('Adicionar ao Carrinho'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

        ),
      ),
    );
  }
}

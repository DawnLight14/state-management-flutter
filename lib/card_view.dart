import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model untuk representasi data pada card
class Item {
  final String title;
  final String description;

  Item(this.title, this.description);
}

// Class model untuk menyimpan dan mengelola state card
class CardModel extends ChangeNotifier {
  List<Item> _items = [
    Item('Item 1', 'Description for Item 1'),
    Item('Item 2', 'Description for Item 2'),
    Item('Item 3', 'Description for Item 3'),
  ];

  List<Item> get items => _items;

  // Method untuk menambahkan item baru
  void addItem(Item item) {
    _items.add(item);
    notifyListeners(); // Memperbarui tampilan setelah penambahan item
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CardModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Card View with State Management'),
          ),
          body: CardView(),
        ),
      ),
    ),
  );
}

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardModel = Provider.of<CardModel>(context);
    final List<Item> items = cardModel.items;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(items[index].title),
            subtitle: Text(items[index].description),
            onTap: () {
              // Menghapus item saat kartu diklik
              cardModel.items.removeAt(index);
              cardModel.notifyListeners(); // Memperbarui tampilan setelah penghapusan item
            },
          ),
        );
      },
    );
  }
}

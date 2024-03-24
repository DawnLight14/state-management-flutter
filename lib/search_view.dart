import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Buat class model untuk representasi data yang akan dicari
class Item {
  final String name;

  Item(this.name);
}

// Buat class untuk menyimpan dan mengelola state pencarian
class SearchModel extends ChangeNotifier {
  List<Item> _items = [
    Item('Apple'),
    Item('Banana'),
    Item('Orange'),
    Item('Grapes'),
  ];
  
  List<Item> _searchResults = [];

  List<Item> get items => _items;
  List<Item> get searchResults => _searchResults;

  // Method untuk melakukan pencarian
  void search(String query) {
    _searchResults = _items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners(); // Memperbarui tampilan setelah pencarian selesai
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SearchModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Search View with State Management'),
        ),
        body: SearchView(),
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchModel = Provider.of<SearchModel>(context);
    final List<Item> items = searchModel.searchResults.isNotEmpty
        ? searchModel.searchResults
        : searchModel.items;

    return Column(
      children: [
        TextField(
          onChanged: (query) {
            // Panggil method search() ketika ada perubahan pada teks pencarian
            searchModel.search(query);
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            contentPadding: EdgeInsets.all(10.0),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index].name),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model untuk representasi data pada nested scroll view
class NestedModel extends ChangeNotifier {
  List<String> _list1 = List.generate(10, (index) => 'List 1 Item ${index + 1}');

  List<String> get list1 => _list1;

  // Method untuk menambahkan item ke dalam list 1
  void addItemToList1() {
    _list1.add('List 1 Item ${_list1.length + 1}');
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NestedModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Nested Scroll View with State Management'),
          ),
          body: NestedView(),
        ),
      ),
    ),
  );
}

class NestedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nestedModel = Provider.of<NestedModel>(context);

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            title: Text('Nested Scroll View'),
            pinned: true,
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Flexible Space Title'),
              centerTitle: true,
            ),
          ),
        ];
      },
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Menambahkan item ke dalam list 1
              nestedModel.addItemToList1();
            },
            child: Text('Add Item to List 1'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: nestedModel.list1.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(nestedModel.list1[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

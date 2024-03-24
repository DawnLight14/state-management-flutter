import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model untuk menyimpan dan mengelola state tab
class TabModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  // Method untuk mengubah tab yang aktif
  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // Memperbarui tampilan setelah perubahan tab
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TabModel(),
      child: MaterialApp(
        home: TabView(),
      ),
    ),
  );
}

class TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabModel = Provider.of<TabModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tab View with State Management'),
      ),
      body: IndexedStack(
        index: tabModel.currentIndex,
        children: [
          TabContent(title: 'Tab 1 Content'),
          TabContent(title: 'Tab 2 Content'),
          TabContent(title: 'Tab 3 Content'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabModel.currentIndex,
        onTap: (index) {
          // Mengatur tab yang aktif ketika salah satu tab di tap
          tabModel.setCurrentIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tab 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tab 3',
          ),
        ],
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final String title;

  TabContent({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

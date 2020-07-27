import 'package:flutter/material.dart';

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Daily'.toUpperCase()),
    Tab(text: 'Weekly'.toUpperCase()),
    Tab(text: 'Monthly'.toUpperCase())
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('ThingsToDo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          tabs: myTabs,
          controller: _tabController,
          indicatorWeight: 5.0,
          unselectedLabelStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          String label = tab.text.toLowerCase();
          return Center(
              child: Text(
            'This is the $label tab',
            style: const TextStyle(fontSize: 36),
          ));
        }).toList(),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
          hintText: 'Search Task',
          suffixIcon: Icon(Icons.search),
        ),
      ),
    ));
  }
}

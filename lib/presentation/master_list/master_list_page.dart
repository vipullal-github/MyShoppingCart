import 'package:flutter/material.dart';


class MasterListPage extends StatefulWidget {
  const MasterListPage({super.key});

@override
  State<MasterListPage> createState() => _MasterListPageState();
}

class _MasterListPageState extends State<MasterListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MasterListScreen")),
      body: const Placeholder(),
  );
}
}
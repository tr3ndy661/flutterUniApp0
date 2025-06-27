import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ThingsToBuyPage extends StatefulWidget {
  const ThingsToBuyPage({super.key});

  @override
  State<ThingsToBuyPage> createState() => _ThingsToBuyPageState();
}

class _ThingsToBuyPageState extends State<ThingsToBuyPage> {
  final TextEditingController _controller = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  CollectionReference get thingsCollection => FirebaseFirestore.instance
      .collection('users')
      .doc(user?.uid)
      .collection('things_to_buy');

  void _addThing() async {
    if (_controller.text.trim().isEmpty) return;
    await thingsCollection.add({'item': _controller.text.trim()});
    _controller.clear();
  }

  void _deleteThing(String id) async {
    await thingsCollection.doc(id).delete();
  }

  void _updateThing(String id, String newValue) async {
    await thingsCollection.doc(id).update({'item': newValue});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Things To Buy')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Add new item'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addThing,
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: thingsCollection.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No items yet.'));
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    final item = doc['item'];
                    return ListTile(
                      title: Text(item),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () async {
                              final controller = TextEditingController(text: item);
                              final result = await showDialog<String>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Edit item'),
                                  content: TextField(
                                    controller: controller,
                                    autofocus: true,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, controller.text),
                                      child: Text('Save'),
                                    ),
                                  ],
                                ),
                              );
                              if (result != null && result.trim().isNotEmpty) {
                                _updateThing(doc.id, result.trim());
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteThing(doc.id),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

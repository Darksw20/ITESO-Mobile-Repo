import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_querys/content/fs_admin_table.dart';
import 'package:firebase_querys/content/notes/item_note.dart';
import 'package:firebase_querys/create_form/new_note_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class HomePage extends StatelessWidget {
  final _fabKey = GlobalKey<ExpandableFabState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => FsAdminTable(),
                ),
              );
            },
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
      body: FirestoreListView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        pageSize: 15,
        query: getNotesQuery(
            "findByName", FirebaseAuth.instance.currentUser!.uid,
            name: "test"),
        // query: getNotesQuery("sortByDate", FirebaseAuth.instance.currentUser!.uid),
        // query: getNotesQuery("", FirebaseAuth.instance.currentUser!.uid),
        itemBuilder: (BuildContext context,
            QueryDocumentSnapshot<Map<String, dynamic>> document) {
          return ItemNote(
              noteContent: document.data(),
              onDelete: () {
                print("Note deleted");
              });
        },
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _fabKey,
        // type: ExpandableFabType.up,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            tooltip: "New note",
            child: Icon(Icons.file_copy),
            onPressed: () {
              print("New note button");
              _fabKey.currentState?.toggle();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => NewNoteForm(),
                ),
              );
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            tooltip: "New folder",
            child: Icon(Icons.folder),
            onPressed: () {
              _fabKey.currentState?.toggle();
            },
          ),
        ],
      ),
    );
  }
}

// Separated function for building the query
Query<Map<String, dynamic>> getNotesQuery(String operation, String userId,
    {String? name}) {
  String collection = "tweet";

  if (operation == "findByName") {
    return FirebaseFirestore.instance
        .collection(collection)
        .where("userId", isEqualTo: userId)
        .where("data.title", isGreaterThanOrEqualTo: name)
        .where("data.title", isLessThanOrEqualTo: '${name!}\uf8ff');
  } else if (operation == "sortByDate") {
    return FirebaseFirestore.instance
        .collection(collection)
        .where("userId", isEqualTo: userId)
        .orderBy("date");
  }

  return FirebaseFirestore.instance
      .collection(collection)
      .where("userId", isEqualTo: userId);
}

// ignore_for_file: avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jsonblob/form.dart';
import 'package:jsonblob/kullaniciUpdate.dart';
import 'package:jsonblob/models/hedef.dart';
import 'package:jsonblob/update.dart';

class kullaniciListele extends StatefulWidget {
  const kullaniciListele({Key? key}) : super(key: key);

  @override
  State<kullaniciListele> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<kullaniciListele> {
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.school, color: Colors.blue),
        title:
            const Text("kullanici ara", style: TextStyle(color: Colors.blue)),
        actions: [
          IconButton(
              color: Colors.blue,
              onPressed: () {
                showSearch(context: context, delegate: searchDelegate());
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: UserInformation(),
    );
  }
}

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('kullanici').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('hatalı işlem');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;

            var id = data['rid'];

            return Card(
              child: ListTile(
                trailing: IconButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) =>
                                  kullaniciUpdate(id: id)));
                    },
                    icon: const Icon(Icons.list)),
                title: Text(data['adSoyad']),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class searchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return super.appBarTheme(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    Container();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        color: Colors.blue,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext) => kullaniciListele()));
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
}

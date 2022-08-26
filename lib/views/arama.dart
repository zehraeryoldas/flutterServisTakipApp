// ignore_for_file: avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jsonblob/main.dart';
import 'package:jsonblob/views/ekle.dart';
import 'package:jsonblob/views/kullaniciUpdate.dart';

class kulllaniciArama extends StatefulWidget {
  const kulllaniciArama({Key? key}) : super(key: key);

  @override
  State<kulllaniciArama> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<kulllaniciArama> {
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

class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Telefon no giriniz")),
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
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        color: Colors.blue,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (BuildContext) => MyApp()));
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    //return Container();
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('kullanici')
        .where('telefon', isEqualTo: query)
        .where('durum', isEqualTo: true)
        .snapshots();

    // TODO: implement buildResults
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
                subtitle: Text('TelefonNo:' + data['telefon']),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      //child: telefonNoList(),
      child: UserInformation(),
    );
  }
}

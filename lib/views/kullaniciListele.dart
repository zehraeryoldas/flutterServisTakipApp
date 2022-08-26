import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jsonblob/views/giris.dart';

class kullaniciListeleme extends StatefulWidget {
  const kullaniciListeleme({super.key});

  @override
  State<kullaniciListeleme> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<kullaniciListeleme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Arayuz()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
        title: const Text(
          "Kullanıcı Listele",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: telefonNoList(),
    );
  }
}

class telefonNoList extends StatefulWidget {
  @override
  _telefonNoListState createState() => _telefonNoListState();
}

class _telefonNoListState extends State<telefonNoList> {
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
                title: Text(data['adSoyad']),
                subtitle: Text('TelefonNo:' + data['telefon']),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

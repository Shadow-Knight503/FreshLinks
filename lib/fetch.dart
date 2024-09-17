import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Fetch extends StatefulWidget {
  const Fetch({super.key});

  @override
  State<Fetch> createState() => _FetchState();
}

// class Prod{
//   String itm, qty;
//   num prc;
//   Prod(this.itm, this.qty, this.prc);
// }


class _FetchState extends State<Fetch> {
  final Stream<QuerySnapshot> _prodStrm = FirebaseFirestore.instance.collection("Fresh_Products").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _prodStrm, 
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snp) {
        if (snp.hasError) {
          return Text("Oops, it's an Error, ${snp.error}");
        }
        if (snp.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        return ListView(
          padding: const EdgeInsets.all(15),
          children: snp.data!.docs.map((DocumentSnapshot doc) {
          Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
            return Tile(data["Item"], data["Quantity"], data["StartPrice"], data["Img"]);
          }).toList(),
        );
      }
    );
  }
  Widget Tile(String itm, String qty, num prc, String src) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(30, 81, 40, 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(216, 233, 168, 0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.network(src, height: 100),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(itm, style: const TextStyle(color: Color.fromRGBO(216, 233, 168, 1),
                  fontSize: 20, fontWeight: FontWeight.bold,
                )),
                Text(qty, style: const TextStyle(color: Color.fromRGBO(216, 233, 168, 1),
                  fontSize: 18,
                )),
                const SizedBox(height: 5),
                Text("Rs ${prc.toString()}", style: const TextStyle(color: Color.fromRGBO(216, 233, 168, 1),
                  fontSize: 16, fontWeight: FontWeight.bold,
                )),
              ]
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List<Widget> pages(BuildContext context) {
    // list 1
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(148, 100, 141, 187),
                borderRadius: BorderRadius.circular(20),
              ),
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance
                        .collection('lock_status')
                        .doc('locker1')
                        .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(child: Text('data tidak ditemukan'));
                  }
                  DocumentSnapshot<Map<String, dynamic>> data = snapshot.data!;
                  String status = data.get("status");
                  // Menampilkan gambar berdasarkan status
                  return Center(
                    child: Image.asset(
                      status == "tertutup"
                          ? 'assets/images/lock.png'
                          : 'assets/images/unlock.png',
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(148, 100, 141, 187),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Status = terisi',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
      // list 2
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(148, 100, 141, 187),
                borderRadius: BorderRadius.circular(20),
              ),
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance
                        .collection('lock_status')
                        .doc('locker2')
                        .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(child: Text('data tidak ditemukan'));
                  }
                  DocumentSnapshot<Map<String, dynamic>> data = snapshot.data!;
                  String status = data.get("status");
                  // Menampilkan gambar berdasarkan status
                  return Center(
                    child: Image.asset(
                      status == "tertutup"
                          ? 'assets/images/lock.png'
                          : 'assets/images/unlock.png',
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(148, 100, 141, 187),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Status = terisi',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
      // list 3
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(148, 100, 141, 187),
                borderRadius: BorderRadius.circular(20),
              ),
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance
                        .collection('lock_status')
                        .doc('locker3')
                        .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(child: Text('data tidak ditemukan'));
                  }
                  DocumentSnapshot<Map<String, dynamic>> data = snapshot.data!;
                  String status = data.get("status");
                  // Menampilkan gambar berdasarkan status
                  return Center(
                    child: Image.asset(
                      status == "tertutup"
                          ? 'assets/images/lock.png'
                          : 'assets/images/unlock.png',
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(148, 100, 141, 187),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Status = terisi',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }
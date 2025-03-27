import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lockbox_app/features/dashboard/data/api/crud.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;
  final Firedata firedata = Firedata();

  void navigateindex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Column(
        children: [
          //
          // Title
          //
          Padding(
            padding: EdgeInsets.symmetric(vertical: kToolbarHeight),
            child: Center(
              child: Text(
                'Dashboard',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          //
          // Menu of Content
          //
          SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // locker 1
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        navigateindex(0);
                      });
                    },
                    child: Text('Locker 1'),
                  ),
                  // locker 2
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        navigateindex(1);
                      });
                    },
                    child: Text('Locker 2'),
                  ),
                  // locker 3
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        navigateindex(2);
                      });
                    },
                    child: Text('Locker 3'),
                  ),
                ],
              ),
            ),
          ),
          //
          // divider
          //
          SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 50),
            child: Divider(height: 2, color: Colors.grey),
          ),
          //
          // full of content
          //
          pages(context)[selectedIndex],
          //
          // Action Button
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    await firedata.createOrUpdate('locker${selectedIndex + 1}');
                  },
                  icon: Icon(Icons.email),
                  label: Text('OTP To Email'),
                ),
                Card(
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.camera)),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.email),
                  label: Text('OTP To SMS'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

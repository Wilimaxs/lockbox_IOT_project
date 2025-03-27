import 'package:flutter/material.dart';
import 'package:lockbox_app/features/dashboard/data/api/crud.dart';
import 'package:lockbox_app/features/dashboard/presentation/widgets/content.dart';

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

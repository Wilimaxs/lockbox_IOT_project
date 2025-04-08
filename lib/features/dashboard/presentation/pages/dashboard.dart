import 'package:flutter/material.dart';
import 'package:lockbox_app/features/dashboard/data/api/token_to_firebase.dart';
import 'package:lockbox_app/features/dashboard/presentation/widgets/capture.dart';
import 'package:lockbox_app/features/dashboard/presentation/widgets/content.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final Firedata firedata = Firedata();
  final GlobalKey<FormState> formkeyemail = GlobalKey<FormState>();
  final GlobalKey<FormState> formkeysms = GlobalKey<FormState>();
  final GlobalKey<FormState> formkeyname = GlobalKey<FormState>();

  void navigateindex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            // Title
            //
            Padding(
              padding: EdgeInsets.symmetric(vertical: kToolbarHeight / 2),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            (selectedIndex == 0) ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          navigateindex(0);
                        });
                      },
                      child: Text('Locker 1'),
                    ),
                    // locker 2
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            (selectedIndex == 1) ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          navigateindex(1);
                        });
                      },
                      child: Text('Locker 2'),
                    ),
                    // locker 3
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            (selectedIndex == 2) ? Colors.black : Colors.white,
                      ),
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
            // Form email
            //
            Form(
              key: formkeyemail,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Enter your e-mail",
                    prefixIcon: Icon(Icons.email, color: Colors.black),
                    filled: true,
                    fillColor: const Color.fromARGB(148, 100, 141, 187),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ), // Border default
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ), // focused border
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email cannot be empty";
                    } else if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {
                      return "Invalid e-mail format";
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            //
            // Form Number SMS
            //
            Form(
              key: formkeysms,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Enter your phone number",
                    prefixIcon: Icon(Icons.sms, color: Colors.black),
                    filled: true, // Mengaktifkan background color
                    fillColor: const Color.fromARGB(
                      148,
                      100,
                      141,
                      187,
                    ), // Warna background
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ), // Border default
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ), // Border saat fokus
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number cannot be empty";
                    } else if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
                      return "Invalid phone number format";
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            //
            // Form name
            //
            Form(
              key: formkeyname,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Your Name",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Enter Your Name",
                    prefixIcon: Icon(
                      Icons.indeterminate_check_box_sharp,
                      color: Colors.black,
                    ),
                    filled: true, // Mengaktifkan background color
                    fillColor: const Color.fromARGB(
                      148,
                      100,
                      141,
                      187,
                    ), // Warna background
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ), // Border default
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ), // Border saat fokus
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty";
                    }
                    return null;
                  },
                ),
              ),
            ),
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
                      if (formkeyemail.currentState!.validate()) {
                        await firedata.cekEmail(
                          'locker${selectedIndex + 1}',
                          emailController.text,
                          selectedIndex,
                          context,
                        );
                      }
                    },
                    icon: Icon(Icons.email),
                    label: Text('OTP To Email'),
                  ),
                  Card(
                    child: IconButton(
                      onPressed: () {
                        if (formkeyname.currentState!.validate()) {
                          captureAndPreviewImage(
                            context: context,
                            name: nameController.text,
                            docId: 'locker${selectedIndex + 1}',
                          );
                        }
                      },
                      icon: Icon(Icons.camera),
                    ),
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
      ),
    );
  }
}

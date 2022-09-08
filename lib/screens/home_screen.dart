import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_firebase/mode/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_firebase/screens/Leaverequest.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parchi"),
        centerTitle: true,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              SingleChildScrollView(),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  height: 150,
                  child: Image.asset("Assets/images/logo.png",
                      fit: BoxFit.contain),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 100),
                child: Text(
                  "Welcome",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child:
                    Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Text("${loggedInUser.email}",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  ActionChip(
                      label: const Text("Logout"),
                      onPressed: () {
                        logout(context);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Leavepage()));
                    },
                    // Apply For Leave
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 150,
                      width: 300,
                      child: Center(
                          child: Text("Apply For Leave",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  //For Swimming
                  SizedBox(
                    height: 30,
                  ),
                  new GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 150,
                      width: 300,
                      child: Center(
                          child: Text("Swimming Pass",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //For Exams
                  new GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 150,
                      width: 300,
                      child: Center(
                          child: Text("Exams",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //For Results
                  new GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 150,
                      width: 300,
                      child: Center(
                          child: Text("Results",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  // For Library
                  new GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 150,
                      width: 300,
                      child: Center(
                          child: Text("Library",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}

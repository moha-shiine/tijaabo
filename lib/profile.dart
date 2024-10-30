import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(10),
            const CircleAvatar(
              maxRadius: 80,
              backgroundColor: Colors.red,
              child: Center(
                child: Text(
                  "M",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            Gap(8),
            const Text(
              "Mohamed salaad ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Gap(6),
            const Text(
              "flutter and dart devloper ",
              style: TextStyle(fontSize: 15),
            ),
            Gap(10),
            const Text(
              " Flutter development, specializing in building responsive and feature-rich mobile applications. You work with state management using GetX and prioritize the MVC pattern for clean code architecture. Your projects often involve complex UI components such as line charts, bar charts, data tables, ",
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            ListTile(
              leading: Icon(IconlyLight.message, color: Colors.red),
              title: const Text("mohamed22@gmail.com"),
              trailing: Icon(IconlyLight.arrowRight2, color: Colors.red),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(IconlyLight.call, color: Colors.red),
              title: const Text("+252 612657845"),
              trailing: Icon(IconlyLight.arrowRight2, color: Colors.red),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Gap(40),
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
              child: const Center(
                  child: Text(
                "Continous",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

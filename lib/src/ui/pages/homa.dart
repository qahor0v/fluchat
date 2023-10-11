import 'package:fluchat/main.dart';
import 'package:fluchat/src/services/auth_services/auth_services.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AuthServices().logout().then((value) {
              Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const CheckUser(),
                ),
                ModalRoute.withName('/'),
              );
            });
          },
          icon: const Icon(Icons.logout),
        ),
      ),
      body: const Center(
        child: Text("Signed IN!"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pets_life/services/firebase_functions.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase fruits list"),
      ),
      body: Center(
        child: FutureBuilder(
          future: FirebaseFunctionService.instance.getFruits(),
          initialData: [],
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            final fruits = snapshot.hasData ? snapshot.data : [];
            if (fruits.length == 0) return Text("There are no fruits");
            return ListView.builder(
              itemCount: fruits.length,
              itemBuilder: (_, index) {
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    title: Text('${fruits[index]}'),
                    trailing: Icon(Icons.more_vert),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

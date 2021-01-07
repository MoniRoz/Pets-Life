import 'package:flutter/material.dart';
import 'package:pets_life/services/firebase_functions.dart';
import 'package:pets_life/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _fruits =
      FirebaseFunctionService.instance.call<List<dynamic>>("fruitsList");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of fruits'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: _fruits,
          initialData: [],
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            final fruits = snapshot.hasData ? snapshot.data : [];
            if (fruits is List<dynamic> && fruits.length > 0) {
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
            }

            return Text("There are no fruits");
          },
        ),
      ),
    );
  }
}

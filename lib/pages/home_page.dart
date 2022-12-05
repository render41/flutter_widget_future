import 'package:flutter/material.dart';

class FutureWidget extends StatefulWidget {
  const FutureWidget({super.key});
  @override
  State<StatefulWidget> createState() => _FutureWidget();
}

class _FutureWidget extends State<FutureWidget> {
  // Método Assincrono, que simula uma requisição de API.
  // Demora 3 segundos para carregar.
  Future<String> getToken() => Future<String>.delayed(
        const Duration(seconds: 2),
        () => 'Token Loaded',
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: getToken(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(
                '${snapshot.data}',
                style: const TextStyle(fontSize: 20),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
                style: const TextStyle(fontSize: 20),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 60, 60, 60),
              ),
            );
          } else {
            return const Center(
              child: Text('No load'),
            );
          }
        },
      ),
    );
  }
}

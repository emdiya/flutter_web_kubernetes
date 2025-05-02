import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const HelloKubernetesApp());
}

class HelloKubernetesApp extends StatelessWidget {
  const HelloKubernetesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Kubernetes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HelloKubernetesPage(),
    );
  }
}

class HelloKubernetesPage extends StatelessWidget {
  const HelloKubernetesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Kubernetes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Updated Text Display
            const Text(
              'Hello, I\'m Hosting on Kubernetes!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30), // Spacing between text and logos

            const Text(
              'Add Jenkins',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30), // Spacing between text and logos

            // Logos in a Row
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center logos horizontally
              children: <Widget>[
                // Flutter Logo (SVG from network)
                SvgPicture.network(
                  'https://upload.wikimedia.org/wikipedia/commons/7/79/Flutter_logo.svg',
                  height: 50,
                ),
                const SizedBox(width: 20), // Spacing between logos

                // GitHub Logo (SVG from network)
                SvgPicture.network(
                  'https://upload.wikimedia.org/wikipedia/commons/9/91/Octicons-mark-github.svg',
                  height: 50,
                ),
                const SizedBox(width: 20), // Spacing between logos

                // Jenkins Logo (SVG from network)
                SvgPicture.network(
                  'https://upload.wikimedia.org/wikipedia/commons/e/e9/Jenkins_logo.svg',
                  height: 50,
                ),
                const SizedBox(width: 20), // Spacing between logos

                // Kubernetes Logo (SVG from network)
                SvgPicture.network(
                  'https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg',
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

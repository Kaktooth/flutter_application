import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Application', files: [
        File(name: "file1", extention: ".exe", size: 1.16),
        File(name: "table", extention: ".xlsx", size: 10.21),
        File(name: "Van_Gogh-Starry_Night", extention: ".png", size: 1.37),
        File(
            name: "ubuntu-22.04.3-desktop-amd64",
            extention: ".iso",
            size: 4919.37),
        File(
            name: "microsoft-robotics-developer-studio",
            extention: ".exe",
            size: 296.582),
      ]),
      initialRoute: '/',
      routes: {
        '/second': (context) => const Page(title: 'Next Page', bugFixRequest: [
              BugFixRequest(
                  label: "Trees not loading in scene 2",
                  severity: "MEDIUM",
                  description: "Its not loading......",
                  reproduceMethod: "click here......"),
              BugFixRequest(
                  label: "Server is crashing",
                  severity: "CRITICAL",
                  description: "Its crashing......",
                  reproduceMethod: "enter this...."),
              BugFixRequest(
                  label: "Object is disapiring",
                  severity: "HIGH",
                  description: "Its just disapeared......",
                  reproduceMethod: "click here......"),
              BugFixRequest(
                  label: "Increased loading time",
                  severity: "LOW",
                  description: "Its slow......",
                  reproduceMethod: "click here......."),
            ]),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, required this.files});
  final String title;
  final List<File> files;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Stack(
        alignment: const Alignment(0.6, 0.6),
        children: [
        ListView.builder(
          itemCount: files.length,
          itemBuilder: (context, index) {
            final item = files[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
         ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Next'),
        ),
      ],
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({super.key, required this.title, required this.bugFixRequest});

  final String title;
  final List<BugFixRequest> bugFixRequest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Stack(
        alignment: const Alignment(0.6, 0.6),
        children: [
        ListView.builder(
          itemCount: bugFixRequest.length,
          itemBuilder: (context, index) {
            final item = bugFixRequest[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
         ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
      ],
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class File implements ListItem {
  const File({required this.name, required this.extention, required this.size});
  final String name;
  final String extention;
  final double size;

  @override
  Widget buildTitle(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        name + extention,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      Text(
        size.toString() + "MB",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    ]);
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class BugFixRequest implements ListItem {
  const BugFixRequest(
      {required this.label,
      required this.severity,
      required this.description,
      required this.reproduceMethod});

  final String label;
  final String severity;
  final String description;
  final String reproduceMethod;

  @override
  Widget buildTitle(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        label,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        severity,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    ]);
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

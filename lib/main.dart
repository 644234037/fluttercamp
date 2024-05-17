import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: Image.asset(
                  "image/11.jpeg",
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              // Image.network("https://themomentum.co/wp-content/uploads/2020/03/TheMO-the-list-my-neighbor-totoro.jpg"),
              const SizedBox(height: 6),
              const Text(
                "Misha eiei",
                style: TextStyle(fontSize: 20),
              ),
              const Row(
                children: [
                  Icon(Icons.calendar_month_outlined),
                  SizedBox(width: 6),
                  Text("My brithday : 10/11/2002 "),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  itemPost(127, "Total post"),
                  itemPost(359, "following"),
                  itemPost(1520, "follower"),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    debugPrint("ElevatedButton");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "จะบ้าจะเครซี่",),));
                  },
                  child: const Text("Go to home")),
                  
            ],
          ),
        ),
      ),
    );
  }

  Column itemPost(int number, String k) {
    return Column(
      children: [
        Text("$number"),
        Text(k),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton (
          onPressed: () {
          debugPrint("Go pokemon Dex");
           Navigator.push(context, MaterialPageRoute(builder: (context) => Pokemon(),));
           
        },
         child:const Text(" Prokemon Dex")),
         
      ),
    );
  }
}
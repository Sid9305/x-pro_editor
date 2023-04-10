import 'package:flutter/material.dart';
import '../dummy/dummy.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({Key? key}) : super(key: key);

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {






  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Colors.indigo, Colors.cyanAccent
          ]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add_circle,color: Colors.white,size: 45,),
            Text(
              'New Project',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:20.0,
                  color: Colors.white
              ),
            )

          ],
        ),
      ),
    );
  }
}

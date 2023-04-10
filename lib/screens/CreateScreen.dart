import 'package:Xpro_editor/components/colors.dart';
import 'package:Xpro_editor/dummy/dummy.dart';
import 'package:Xpro_editor/screens/createProject.dart';
import 'package:Xpro_editor/widgets/ProjectWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    super.initState();
  }

  List<DummyProjects> dummyP = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateProject()));

                            setState(() {
                              dummyP.add(
                                DummyProjects(
                                    title: "title 1",
                                    image: "assets/sunrise.jpg",
                                    subtitle: 'Last Seen: ' + "10/12/2022"),
                              );
                            });
                          },
                          child: const ProjectWidget())),
                  Expanded(
                      child: ListView.builder(
                          itemCount: dummyP.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shadowColor: Colors.white,
                                color: bgColor,
                                child: ListTile(
                                  leading:
                                      // const Icon(Icons.panorama_rounded,color: Colors.white60),
                                      Image(
                                          image:
                                              AssetImage(dummyP[index].image)),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit,
                                          color: Colors.white)),
                                  title: Text(
                                    dummyP[index].title,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(dummyP[index].subtitle,
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            );
                          })),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

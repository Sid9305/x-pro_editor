import 'package:Xpro_editor/dummy/dummy.dart';
import 'package:Xpro_editor/screens/ImportScreen.dart';
import 'package:Xpro_editor/screens/VideoPickerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/EditScreen.dart';
import '../components/colors.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({Key? key}) : super(key: key);

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {

  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    super.initState();
  }


  TextEditingController projectname = TextEditingController();

  List<DummyProjects> dummyP = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: FloatingActionButton.extended(
                backgroundColor: bgColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImportScreen()));
                },
                label: Row(
                  children: const [
                    Icon(Icons.folder_open),
                    Text("Import"),
                  ],
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          'Project Name',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: projectname,
                          decoration: const InputDecoration(
                            hintText: "Enter Project Name",
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          'Aspect Ratio',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Wrap(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 18.0),
                              child: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 45.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.airplay_rounded),
                                      Text("16:9")
                                    ],
                                  ),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 18.0),
                              child: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 45.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.airplay_rounded),
                                      Text("9:16")
                                    ],
                                  ),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 18.0),
                              child: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 45.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.airplay_rounded),
                                      Text("1:1")
                                    ],
                                  ),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 18.0),
                              child: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 45.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.airplay_rounded),
                                      Text("4:3")
                                    ],
                                  ),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 18.0),
                              child: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 45.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.airplay_rounded),
                                      Text("3:4")
                                    ],
                                  ),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 18.0),
                              child: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 45.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.airplay_rounded),
                                      Text("4:5")
                                    ],
                                  ),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 18.0),
                              child: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 45.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.airplay_rounded),
                                      Text("2:35:1")
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    dummyP.add(
                      DummyProjects(
                          title: projectname.text,
                          image: "assets/sunrise.jpg",
                          subtitle: 'Last Seen: ' + "10/12/2022"),
                    );
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(
                          builder: (context) => const VideoPickerPage()
                      )
                  );
                },
                label: const Text(
                  "Create",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

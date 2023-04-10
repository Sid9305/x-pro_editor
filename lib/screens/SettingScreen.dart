import 'package:Xpro_editor/components/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool valNotify1= true;
  bool valNotify2=false;
  bool valNotify3=false;

  onChangedFunction1(bool newvalue1)
  {
    setState(() {
      valNotify1 = newvalue1;
    });
  }
  onChangedFunction2(bool newvalue2)
  {
    setState(() {
      valNotify2 = newvalue2;
    });
  }
  onChangedFunction3(bool newvalue3)
  {
    setState(() {
      valNotify3 = newvalue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        leading:
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      backgroundColor: bgColor,
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountOption(context, "Change Password"),
            buildAccountOption(context, "Content Settings"),
            buildAccountOption(context, "Social"),
            buildAccountOption(context, "Language"),
            buildAccountOption(context, "Privacy and Security "),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Notifications",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            buildNotificationOption("Theme Dark", valNotify1, onChangedFunction1),
            buildNotificationOption("Account Active", valNotify2, onChangedFunction2),
            buildNotificationOption("Opportunity", valNotify3, onChangedFunction3),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: shawdowColor,
                  padding: const EdgeInsets.symmetric(horizontal:40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ), onPressed: () {  },
                child: Text("Sign Out"),
              ),
            )
          ],
        ),
      )),
    );
  }

  Padding buildNotificationOption(String title, bool value,Function onChangeMethod)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white60,
          ),),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
                value: value,
                onChanged: (bool newValue){
                  onChangeMethod(newValue);
                },
              activeColor: Colors.blue,
              trackColor: Colors.grey,
            ),
          )
        ],
      ),
    );
  }


  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Option 1"),
                    const Text("Option 1"),
                  ],
                ),actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: const Text("Close"))
              ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white60),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white60,
            )
          ],
        ),
      ),
    );
  }
}

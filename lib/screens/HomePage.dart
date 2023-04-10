import 'package:Xpro_editor/components/colors.dart';
import 'package:Xpro_editor/dummy/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text("Login Page"),
      ),
      body: Center(
        child: Obx(() {
          if (controller.googleAccount.value == null)
            return buildLoginButton();
          else
            return buildProfileView();
        }),
      ),
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      backgroundColor: shawdowColor,
      onPressed: () {
        controller.login();
      },
      label: Row(
        children: const [
          Image(image: AssetImage("assets/google.png"), width: 30, height: 30),
          // Icon(FontAwesomeIcons.google,color: Colors.blue),
          SizedBox(
            width: 10.0,
          ),
          Text(
            "Sign-in with Google",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Column buildProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundImage:
                Image.network(controller.googleAccount.value?.photoUrl ?? "")
                    .image,
            radius: 70,
          ),
        ),
        Text(
          controller.googleAccount.value?.displayName ?? "",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27
          ),
        ),
        Text(
          controller.googleAccount.value?.email ?? "",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text("Logout"),
          onPressed: () {
            controller.logout();
          },
        ),
      ],
    );
  }
}

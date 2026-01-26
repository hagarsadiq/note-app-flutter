import 'package:flutter/material.dart';
import 'RegisterScreen.dart';
import 'home.dart';

class Login extends StatefulWidget {
  //final List<Map<String, String>> users;
 // Login({required this.users});
  Login({super.key});

  @override

  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 final TextEditingController username = TextEditingController();
 final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Username",
                hintText: "input your Username",
               // prefixIcon: Icon(Icons.person),
                icon: Icon(Icons.account_circle_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Password",
                hintText: "input your password",
               // prefixIcon: Icon(Icons.password),
                icon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),

          ElevatedButton(
            style: ButtonStyle(
backgroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: () {
              if(username.text =="hagar" && password.text=="112233")
                Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => home()));
              //(route) => false,);}
    else {
    Navigator.of(
    context,
    ).push(MaterialPageRoute(builder: (context) => Login()));

    }
            },
            child: Text("Login"),
          ),
          SizedBox(height: 10),

          TextButton(

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },

            child: Text("Create Account"),

          ),
        ],
      ),
    );

  }
}
/*import 'package:flutter/material.dart';
import 'home.dart';
import 'RegisterScreen.dart';

class Login extends StatefulWidget {
  final List<Map<String, String>> users;
  Login({required this.users});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();

  void login() {
    for (var user in widget.users) {
      if (user["name"] == username.text &&
          user["pass"] == password.text) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
        return;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("بيانات الدخول غير صحيحة")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: username,
            decoration: InputDecoration(labelText: "Username"),
          ),
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(labelText: "Password"),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: login,
            child: Text("Login"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            child: Text("Create Account"),
          ),
        ],
      ),
    );
  }
}*/
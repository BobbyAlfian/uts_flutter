import 'package:flutter/material.dart';
import 'package:uts_ui/pages/home_page.dart';




class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {
  String user = "Bobby";
  String pass = "Bobby123";
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Coffe Shop',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
                  )),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 20),
              )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),

              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                onPressed: () {
                  if(nameController.text == user && passwordController.text==pass){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage(namevar: '',)),
                    );
                  }else{
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                      return new AlertDialog(
                        title: const Text('Error'),
                        content: new Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Login Failed"),
                          ],
                        ),
                        actions: <Widget>[
                          new ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    }
                    );
                  }
                },
                )
              ),
                  Row(
                    children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Log in as guest',
                          style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            // login as guest
                            Navigator.push(context,
                             MaterialPageRoute(builder: (context) => HomePage(namevar: "Guest",)),
                            );
                          },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              )),
          ),
        );        
  }
}
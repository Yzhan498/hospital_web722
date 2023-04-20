
import 'package:flutter/material.dart';
import '../comm/comHelper.dart';
import '../database/user_database_helper.dart';
import 'signup.dart';
import 'Home.dart';

class Login extends StatefulWidget {

  const Login({super.key, required this.title});
  final String title;
  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final textControllerName = TextEditingController();
  final textControllerPassword = TextEditingController();

  login() async {
    String uname = textControllerName.text;
    String passwd = textControllerPassword.text;

    if (uname.isEmpty) {
      alertDialog(context, "Please Enter User Name");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Please Enter Password");
    } else {
      await UserDatabaseHelper.getLoginUser(uname, passwd).then((
          userData) {
        if (userData != null) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => const Home()),
                  (Route<dynamic> route) => false);
        } else {
          alertDialog(context, "Error:User Not found");
        }
      }).catchError((error) {
        alertDialog(context, "Error: Login Fail");
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeCare'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),

                Image.asset("assets/images/logo.png"),
                const SizedBox(height: 30.0),
                const Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30.0
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top:20.0),
                  child: TextFormField(
                    validator: (val) => val?.isEmpty == true? 'Please Enter Your Name':null,
                    onSaved: (val)=> textControllerName.text=val!,
                    controller: textControllerName,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: 'User Name'
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top:20.0),
                  child: TextFormField(
                    validator: (val) => val?.isEmpty == true? 'Please Enter Your Password':null,
                    onSaved: (val)=> textControllerPassword.text=val!,
                    controller: textControllerPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password'
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(30.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: FilledButton(
                    child:const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed:(){
                      login();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: FilledButton(
                    child:const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed:(){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Signup(title: 'Sign Up',)));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

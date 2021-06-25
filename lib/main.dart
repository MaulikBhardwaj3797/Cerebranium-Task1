import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(home: MyApp(),));

}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {


  dynamic emailController = TextEditingController();
  dynamic AccountNoController = TextEditingController();
  dynamic mobilenumberController = TextEditingController();
  dynamic FullNameController = TextEditingController();
  dynamic  IfsccodeController = TextEditingController();
  final loginkey = GlobalKey<FormState>();
  String FullName,email,phonenumber,accountnumber,ifsccode;
  final fd = FirebaseDatabase.instance;
  final FirebaseAuth_auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Cerebranium Task'),
        centerTitle: true,
      ),
      //backgroundColor: Colors.white,
      body:new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/jus.png"), fit: BoxFit.cover,),
            ),
          ),
          new Center(
            child: ListView(
              children: [
                Container(
                  height: 50,
                  child: Image.asset(''),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 900,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Form(
                        autovalidate: true,
                        key: loginkey,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 18, 20, 5),
                              child: Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if(value.isEmpty){
                                      return "Full Name can't be blank";
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      borderSide: const BorderSide(width: 3.0),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      borderSide: const BorderSide(width: 1.0),
                                    ),
                                    labelText: 'Full Name',
                                  ),
                                  controller: FullNameController,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 18, 20, 5),
                              child: Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      borderSide: const BorderSide(color: Colors.black,width: 2.0),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      borderSide: const BorderSide(color: Colors.black,width: 2.0),
                                    ),
                                    labelText: 'Email',
                                         ),
                                  controller: emailController,
                                     ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 18, 20, 5),
                              child: Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if(value.isEmpty){
                                      return "Account No can't be blank";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  obscuringCharacter: '*',
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      borderSide: const BorderSide(color: Colors.black,width: 2.0),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      borderSide: const BorderSide(color: Colors.black,width: 2.0),
                                    ),
                                    labelText: 'Account No',
                                  ),
                                  controller: AccountNoController,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 18, 20, 5),
                              child: Container(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if(value.isEmpty || value.length == 0){
                                      return "Mobile Number can't be blank";
                                    }
                                    else if(value.length < 10){
                                      return "Mobile number should be of 10 digits";
                                    }
                                    return null;
                                  },
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      borderSide: const BorderSide(color: Colors.black,width: 2.0),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      borderSide: const BorderSide(color: Colors.black,width: 2.0),
                                    ),
                                    labelText: 'Mobile Number',
                                  ),
                                  controller: mobilenumberController,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 18, 20, 5),
                              child: Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if(value.isEmpty){
                                      return "Account No can't be blank";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  obscuringCharacter: '*',
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      borderSide: const BorderSide(color: Colors.black,width: 2.0),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      borderSide: const BorderSide(color: Colors.black,width: 2.0),
                                    ),
                                    labelText: 'IFSC code',
                                  ),
                                  controller: IfsccodeController,
                                ),


                              ),
                            ),

                              FlatButton(onPressed: (){
                                Map <String,dynamic> data={"field1":FullNameController.text,"fiel2":emailController.text,
                                "field2":AccountNoController.text,"field3":mobilenumberController.text,"field3":IfsccodeController.text};
                                var firestore;
                                firestore.instance.collection("test").add(data);
                              },
                               child: Text("Submit"),
                              color: Colors.blueAccent,)

                               ],
                        ),
                      ),
                      ),
                    ),
                  ),
              ],
            )
          )
        ],
      )
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide(
        color: const Color(0xFFeceff1),width: 2));

    const linkTextStyle = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0079D0));

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/pexels1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal : 50),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 100,),
              SizedBox(width: 110, height: 84,child: Image(image: AssetImage('assets/images1.jpg')),),
              SizedBox(height: 40,),
              Text('Введите номер телефона и пароль',
              style: TextStyle(fontSize: 15, color: Color.fromRGBO(0, 0, 0, 1)),),
              SizedBox(height: 30,),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color (0xFFeceff1),
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  labelText: 'Телефон',
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color (0xFFeceff1),
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  labelText: 'Пароль',
               ),
              ),
              SizedBox(height: 20,),
              SizedBox(width: 154, height: 42,child:
               ElevatedButton(onPressed: () {},
                child: Text('Войти'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0079D0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                ),
               ),
              ),
              SizedBox(height: 60,),
              InkWell(child: const Text('Регистрация', style: linkTextStyle),
                  onTap: () {}),
              SizedBox(height: 10,),
              InkWell(child: Text('Забыли пароль?', style: linkTextStyle),
                  onTap: () {}),
      ],),
          ),
      ),
      ),
    );
  }
}



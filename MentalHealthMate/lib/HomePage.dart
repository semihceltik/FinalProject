import 'dart:ffi';

import 'package:flutter/material.dart';
import 'forumapp.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  void clickFunction(){

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter,colors: [
            Colors.deepPurple.shade700,
            Colors.deepPurple.shade500,
            Colors.deepPurple.shade900,
          ],)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40,),
            Padding(
                padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                <Widget>[
                  Text('Giris Yap',style: TextStyle(color:Colors.white,fontSize: 40),),
                  SizedBox(height: 10,),
                  Text('Tekrar Hos Geldiniz',style: TextStyle(color:Colors.white,fontSize: 18),),
                ],
            ),
            ),
            SizedBox(height: 20,),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),bottomRight: Radius.circular(60))
              ),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(

                  children: <Widget>[
                    SizedBox(height: 30,),
                    Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          color: Color.fromRGBO(54, 1, 63, 1),
                          blurRadius: 20,
                          offset: Offset(0, 3),
                        )]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(

                            padding: EdgeInsets.all(5) ,
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey))
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Mail ya da Telefon Numarası',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10) ,
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey))
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Şifrenizi giriniz',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Text('Şifrenizi mi Unuttunuz ?', style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 40,),
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.deepPurple.shade500
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => forumapp()),
                            );
                          },
                          child: Text('Giriş Yap'),
                        )
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text('Sosyal Medya ile Devam Et', style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 30,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blueAccent.shade100
                            ),
                            child: Center(
                              child: Text('Facebook',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),),
                            ),
                          ),

                        ),
                        SizedBox(width: 30,),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.shade600
                            ),
                            child: Center(
                              child: Text('Git Hub ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),),
                            ),
                          ),
                        ),
                      ],

                    ),
                  ],
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

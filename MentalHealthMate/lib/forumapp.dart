import 'package:flutter/material.dart';
import 'package:untitled/forumapp2.dart';
import 'package:untitled/Desteksayfasi.dart';
import 'package:untitled/TakipSayfasi.dart';
  class forumapp extends StatefulWidget {
    const forumapp({super.key});
  
    @override
    State<forumapp> createState() => _forumappState();
  }
  
  class _forumappState extends State<forumapp> {
    int simdikiindex = 0;
    final List<Widget> _sayfalar = [
      ReminderPage(),
      ForumPage(),
      PsikolojikDestekSayfasi(),
    ];
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _sayfalar[simdikiindex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: simdikiindex,
          onTap: (index){
            setState(() {
              simdikiindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.follow_the_signs),
            label: 'Takip'),
            BottomNavigationBarItem(icon: Icon(Icons.light),
            label: 'Tavsiye'),
            BottomNavigationBarItem(icon: Icon(Icons.help),
            label: 'Destek')
          ],
        ),
      ) ;
    }
  }
  

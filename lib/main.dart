import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newapp/cubit/dio.dart';
import 'package:newapp/view/screens/home_page.dart';




void main() {
  DioHelper.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(primarySwatch: Colors.deepOrange,
       scaffoldBackgroundColor: Colors.white,
       appBarTheme: const AppBarTheme(
         elevation: 0.0,
         iconTheme:IconThemeData(color: Colors.black,) ,
         backgroundColor: Colors.white,
         centerTitle: true,
         titleTextStyle: TextStyle( color: Colors.black),
         systemOverlayStyle: SystemUiOverlayStyle(
           statusBarColor: Colors.white,
           statusBarIconBrightness: Brightness.dark,
         ),

       ),
       bottomNavigationBarTheme: BottomNavigationBarThemeData(
         type: BottomNavigationBarType.fixed,
         elevation: 20.0,
         backgroundColor: Colors.grey[200],

       ),


     ),
     home: const HomePage(),
   );
  }

}
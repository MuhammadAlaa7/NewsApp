import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newapp/cubit/cubit.dart';
import 'package:newapp/cubit/dio.dart';
import 'package:newapp/cubit/shared.dart';

import 'package:newapp/cubit/states.dart';
import 'package:newapp/view/screens/home_page.dart';

import 'cubit/shared.dart';


void main() async{
WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  await SharedHelper.init();

bool? isDark = SharedHelper.loadData('isDark');

  runApp(  MyApp(isDark));
}

class MyApp extends StatelessWidget{
 // const MyApp({Key? key}) : super(key: key);

  final bool? isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
   return  BlocProvider(
     create: (context)=> NewsCubit()..getBusiness()..changeMode(fromShared: isDark),

     child: BlocConsumer<NewsCubit,NewsStates>(
       listener: (context,state){},
       builder: (context,state)
       {
         var cubit = NewsCubit.get(context);
         return  MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             primarySwatch: Colors.deepOrange,
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
             textTheme: const TextTheme(
               bodyText1: TextStyle(
                 fontSize: 18.0,
                 fontWeight: FontWeight.w400,
                 color: Colors.black,
               ),
             ),

           ),


           darkTheme:  ThemeData(

             primarySwatch: Colors.deepOrange,
             scaffoldBackgroundColor: HexColor('333739'),
             appBarTheme:  AppBarTheme(
               elevation: 0.0,
               iconTheme: const IconThemeData(color: Colors.white,) ,
               backgroundColor:  HexColor('333739') ,
               centerTitle: true,
               titleTextStyle: const TextStyle( color: Colors.white),
               systemOverlayStyle: SystemUiOverlayStyle(
                 statusBarColor: HexColor('333739'),
                 statusBarIconBrightness: Brightness.light,
               ),

             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
               type: BottomNavigationBarType.fixed,
               elevation: 20.0,
               backgroundColor: HexColor('333739'),
               unselectedItemColor: Colors.grey,

             ),

             textTheme: const TextTheme(
               bodyText1: TextStyle(
                 fontSize:18.0,
                 fontWeight: FontWeight.w400,
                 color: Colors.white,

               ),

             ),
           ),

           themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
           home: const HomePage(),
         );
       },
     ),
   );
  }

}
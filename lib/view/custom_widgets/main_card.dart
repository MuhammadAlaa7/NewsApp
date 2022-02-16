import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  MainCard({
    this.onTap,
    required this.label,
    required this.image,
  });
  String label;
  Function()? onTap;
  String image;
  @override
  Widget build(BuildContext context) {


    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap:onTap ,

      child: Container(
        height: deviceHeight*.18,
        margin:const  EdgeInsets.all(8),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(.4),BlendMode.darken ),
              image: NetworkImage(image )),
        ),
        child:  Center(
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.white
              ),
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newapp/view/screens/web_view_screen.dart';


// article here is a map from the whole list >>> I have a list of maps and I'm sending a map according to the index
Widget buildArticleItem(article,context, {isSearch = false}){    // isSearch here is an optional parameter for calling this method in the search screen
  return  InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {return WebViewScreen(article['url']);  }),);
    },
    child: Padding(
      padding:  EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
        fit: BoxFit.cover,
          image: NetworkImage(
            '${article['urlToImage']}'

          )
        ),

                ),



          ),
          const SizedBox(
            width: 20.0,
          ),
            Expanded(
              child: Container(
             //   height: 120.0,
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(

                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),

                    ),
                  ],
                ),
              ),
            ),

        ],
      ),
    ),
  );
}
import 'package:flutter/material.dart';



Widget buildArticleItem(article){
  return  Padding(
    padding:  EdgeInsets.all(16.0),
    child: Row(
      children: [
        Image.network(
        '${article['urlToImage'] ?? 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png'}',
          width: 120,

          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },


          errorBuilder: (context, exception, stackTrack) =>  Icon(Icons.error,
          size: 120,
          color: Colors.grey[500],),
          height: 120,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${article['title']}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,

                ),
                    maxLines: 4,
                overflow: TextOverflow.ellipsis ,
              ),
              Text(
                '${article['publishedAt']}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),

              ),
            ],
          ),
        ),

      ],
    ),
  );
}
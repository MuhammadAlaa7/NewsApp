class ArticleModel{
  String? url,title , description ,image;
  ArticleModel({
    this.url,
    this.description ,
    this.title,
    this.image,
  });

  ArticleModel.fromJson(Map <dynamic , dynamic> json){
    // url = json['url'] ?? '';
    url = json['url']!=null? json['url']:'';
    title = json['title']!=null?json['title']:'';
    description = json['description']!=null?json['description']:'';
    image = json['urlToImage']!=null?json['urlToImage']:'';
  }
}
import 'package:flutter/material.dart';
import 'package:prac1/models/news_model.dart';

class NewsContainer extends StatelessWidget {
  final NewsModel newsModel;
  int index = 0;
  NewsContainer({required this.index, required this.newsModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage(
              fit: BoxFit.cover,
              width: 130,
              height: 130,
              placeholder: const AssetImage('assets/images/loadingGif.gif'),
              image: NetworkImage(newsModel.articles![index].urlToImage ??
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png')),
          Expanded(
            child: Container(
              width: 270,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsModel.articles![index].title == null
                        ? ''
                        : newsModel.articles![index].title.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  SizedBox(
                    child: Text(
                      newsModel.articles![index].author == null
                          ? 'no author'
                          : "By ${newsModel.articles![index].author}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 220,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                newsModel.articles![index].source!.name == null
                                    ? ''
                                    : newsModel.articles![index].source!.name
                                        .toString(),
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                              ),
                              const Icon(Icons.more_horiz),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

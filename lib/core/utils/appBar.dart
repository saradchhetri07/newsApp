import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/daily_news.dart';

AppBar buildCustomAppBar({required VoidCallback onShowSavedArticles}) {
  return AppBar(
    title: const Text(
      "Daily News",
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      GestureDetector(
          onTap: () => onShowSavedArticles,
          child: const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.bookmark,
              color: Colors.black,
            ),
          ))
    ],
  );
}

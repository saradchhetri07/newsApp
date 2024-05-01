import 'package:flutter/material.dart';

import '../../../../../core/utils/appBar.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          onShowSavedArticles: () => _onShowSavedArticlesViewTapped(context)),
      body: const Center(
        child: Text(
          "Page not found",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/SavedArticles');
  }
}

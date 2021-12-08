import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/Custom_search_delegate.dart';
import '../widgets/person_list_widget.dart';
///git
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //jalgasgi
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          )
        ],
      ),
      body: PersonsList(),
    );
  }
}

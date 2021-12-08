import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/features/domain/entities/person_entity.dart';
import 'package:flutter_food/features/presentations/pages/person_details_screen.dart';
import 'package:flutter_food/features/presentations/widgets/cached_network_image_widget.dart';

class SearchResult extends StatelessWidget {
  final PersonEntity personResult;

  const SearchResult({Key? key, required this.personResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonDetailsScreen(person: personResult),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2.0,
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Container(
                child: PersonCachedImage(
                  imageUrl: personResult.image, width: double.infinity, height: 300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                personResult.name,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                personResult.location.name,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}

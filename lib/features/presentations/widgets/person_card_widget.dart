import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/common/app_colors.dart';
import 'package:flutter_food/features/domain/entities/person_entity.dart';
import 'package:flutter_food/features/presentations/pages/person_details_screen.dart';
import 'package:flutter_food/features/presentations/widgets/cached_network_image_widget.dart';

class PersonCard extends StatelessWidget {
  final PersonEntity person;

  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonDetailsScreen(person: person),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              child: PersonCachedImage(
                width: 166,
                height: 166,
                imageUrl: person.image,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    person.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: person.status == 'Alive'
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Text(
                          '${person.status}-${person.species}',
                          style: TextStyle(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Last now location:',
                    style: TextStyle(color: AppColors.greyColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(person.location.name,
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Origin:',
                    style: TextStyle(color: AppColors.greyColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(person.origin.name,
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

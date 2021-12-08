import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food/features/domain/entities/person_entity.dart';
import 'package:flutter_food/features/presentations/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:flutter_food/features/presentations/bloc/person_list_cubit/person_list_state.dart';
import 'package:flutter_food/features/presentations/widgets/person_card_widget.dart';

class PersonsList extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(BuildContext context){
    scrollController.addListener(() {
      if(scrollController.position.atEdge){
        if (scrollController.position.pixels!=0) {
        //  BlocProvider.of<PersonListCubit>(context).loadPerson();
          context.read<PersonListCubit>().loadPerson();
        }  
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    // TODO: implement build
    return BlocBuilder<PersonListCubit, PersonState>(builder: (context, state) {
      List<PersonEntity> persons = [];
      bool isLoading = false;
      if (state is PersonLoading && state.isFirstFetch) {
        return _loadingIndecator();
      } else if(state is PersonLoading){
        persons = state.oldPersonsList;
        isLoading = true;

      }

      else if (state is PersonLoaded) {
        persons = state.personList;
      } else if (state is PersonError) {
        return Text(
          state.message,
          style: TextStyle(color: Colors.white, fontSize: 25),
        );
      }
      return ListView.separated(
        controller: scrollController,
          itemBuilder: (context, index) {
          if(index<persons.length){
            return PersonCard(person: persons[index]);
          } else{

            Timer(Duration(milliseconds:30),() {
              scrollController.jumpTo(scrollController.position.maxScrollExtent);
            });
            return _loadingIndecator();
          }

          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey,
            );
          },
          itemCount: persons.length + (isLoading ? 1 : 0));
    });
  }

  Widget _loadingIndecator() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

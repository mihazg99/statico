import 'package:flutter/material.dart';
import 'package:statico/models/Case.dart';

class MyCaseGridView extends StatelessWidget {

  final Case _case;
  MyCaseGridView(this._case);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(primary: false,shrinkWrap: true,
        itemCount: _case.pictures!.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          var mycase = _case.pictures![index];
          return Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  mycase,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:statico/misc/enums/RateCase.dart';

class TempCardFinal extends StatelessWidget {
  final RateCaseEnum _enum;
  TempCardFinal(this._enum);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Container(
                padding: EdgeInsets.all(12.0),
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Color(
                    0xfff1eeee,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Text(
                  "PRIVREMENO  NEUPORABLJIVO",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lato",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Radio(
                  value: RateCaseEnum.PN1,
                  groupValue: _enum,
                  onChanged: (RateCaseEnum? value) {},
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "PN1",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lato",
                    ),
                  ),
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color(
                      0xfff1eeee,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "potreban\nDETALJAN PREGLED",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lato",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color(
                      0xfff1eeee,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            //ROW 2
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Radio(
                  value: RateCaseEnum.PN2,
                  groupValue: _enum,
                  onChanged: (Object? value) {},
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "PN2",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lato",
                    ),
                  ),
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color(
                      0xfff1eeee,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "potrebne mjere\nHITNE INTERVENCIJE",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lato",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color(
                      0xfff1eeee,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "PROVEDEN BRZI PREGLED",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Lato",
              ),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width - 20,
        height: 295,
        decoration: BoxDecoration(
            color: Color(
              0xffe8db63,
            ),
            borderRadius: BorderRadius.circular(
              20,
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:statico/misc/enums/RateCase.dart';


class UnusableCardFinal extends StatelessWidget {

  final RateCaseEnum _enum;
  UnusableCardFinal(this._enum);

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
                  "NEUPORABLJIVO",
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
                SizedBox(width: 10,),
                Radio(
                  value: RateCaseEnum.N1,
                  groupValue: _enum, onChanged: (Object? value) {  },
                ),
                SizedBox(
                  width: 10,
                ),
                Container(padding: EdgeInsets.all(12.0),
                  child: Text(
                    "N1",textAlign: TextAlign.center,
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
                Container(padding: EdgeInsets.all(12.0),
                  child: Text(
                    "zbog\nVANJSKOG UTJECAJA",
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
            SizedBox(height:15),
            //ROW 2
            Row(
              children: [
                SizedBox(width: 10,),
                Radio(
                  value: RateCaseEnum.N2,
                  groupValue: _enum, onChanged: (Object? value) {  },
                ),
                SizedBox(
                  width: 10,
                ),
                Container(padding: EdgeInsets.all(12.0),
                  child: Text(
                    "N2",textAlign: TextAlign.center,
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
                Container(padding: EdgeInsets.all(12.0),
                  child: Text(
                    "zbog\nOŠTEĆENJA",
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
            SizedBox(height: 15,),
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
              0xffBA3232,
            ),
            borderRadius: BorderRadius.circular(
              20,
            )));
  }
}

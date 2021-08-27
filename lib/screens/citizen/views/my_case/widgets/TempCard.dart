import 'package:flutter/material.dart';

class TempCardCitizen extends StatelessWidget {
  final String labelValue;
  TempCardCitizen(this.labelValue);

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
                SizedBox(width: 10,),
                Radio(
                  value: "potreban\nDETALJAN PREGLED",
                  groupValue: labelValue, onChanged: (String? value) {  },
                ),
                SizedBox(
                  width: 10,
                ),
                Container(padding: EdgeInsets.all(12.0),
                  child: Text(
                    "PN1",textAlign: TextAlign.center,
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
                    "potreban\nDETALJAN PREGLED",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lato",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  width: 170,
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
                  value: "potrebne mjere\nHITNE INTERVENCIJE",
                  groupValue: labelValue, onChanged: (String? value) {  },
                ),
                SizedBox(
                  width: 10,
                ),
                Container(padding: EdgeInsets.all(12.0),
                  child: Text(
                    "PN2",textAlign: TextAlign.center,
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
                    "potrebne mjere\nHITNE INTERVENCIJE",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lato",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  width: 170,
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
        width: MediaQuery.of(context).size.width - 40,
        height: 280,
        decoration: BoxDecoration(
            color: Color(
              0xffe8db63,
            ),
            borderRadius: BorderRadius.circular(
              20,
            )));
  }
}

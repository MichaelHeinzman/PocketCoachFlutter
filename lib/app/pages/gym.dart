import 'package:flutter/material.dart';

class Gym extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        _buildGymImage(),
        _buildRowList(),
        _buildColumnList(),  
      ],
    ));
  }

Widget _buildGymImage() {
  return Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: (
            Image.asset('assets/images/gymfront.jpg')
                
          ),
        );
}

Widget _buildRowList() {
  return Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: 
                _buildKey() +
                _buildTrainer() +
                _buildMap()+
                _buildClasses(),
                
          ),
        )
      );
}

Widget _buildColumnList() {
  return Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: 
                _buildShop() +
                _buildHours() +
                _buildContact(),
                
          ),
        )
      );
}




  List<Widget> _buildShop() {
    return [
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          // Constraints
          //height: 133.33,
          alignment: Alignment.center,

          // Decoration
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),

        child: Column(
          children: <Widget>[
            Text("Shop",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(" ",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("T Shirt: \$15.00",
            textAlign: TextAlign.center,
            ),
            Text(" ",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Snack: \$3.00",
            textAlign: TextAlign.center,
            )
          ],
        )
        )
      )
    ];
  }

  List<Widget> _buildHours() {
    return [
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          // Constraints
          //height: 133.33,
          alignment: Alignment.center,

          // Decoration
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),

        child: Column(
          children: <Widget>[
            Text("Hours",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(" ",
            textAlign: TextAlign.center,
            ),
            Text("Mon-Thurs: 6:00am - 11:00am",
            textAlign: TextAlign.center,
            ),
            Text(" ",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Sat: 9:00am - 8:00pm",
            textAlign: TextAlign.center,
            ),
            Text(" ",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Sun: 12:00am - 5:00pm",
            textAlign: TextAlign.center, 
            )
          ],
        )
        )
      )
    ];
  }

  List<Widget> _buildContact() {
    return [
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          // Constraints
          //height: 133.33,
          alignment: Alignment.center,

          // Decoration
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),

        child: Column(
          children: <Widget>[
            Text("Contact",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(" ",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Phone: 1-(800)-GYM-STUFF",
            textAlign: TextAlign.center,
            ),
            Text(" ",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Email: gym@gym.com",
            textAlign: TextAlign.center,
            )
          ],
        )
        )
      )
    ];
  }


List<Widget> _buildKey() {
    return [
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: Container(
          // Constraints
          width: 75,
          height: 95,
          alignment: Alignment.center,

          // Decoration
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/QR_icon.png'),
              Text("Key",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        )
      )
    ];
  }

  List<Widget> _buildTrainer() {
    return [
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: Container(
          // Constraints
          width: 75,
          height: 95,
          alignment: Alignment.center,

          // Decoration
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),

          child: Column(
            children: <Widget>[
              Image.asset('assets/images/phoneicon.png'),
              Text("Phone",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        )
      )
    ];
  }

  List<Widget> _buildMap() {
    return [
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: Container(
          // Constraints
          width: 75,
          height: 95,
          alignment: Alignment.center,

          // Decoration
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),

          child: Column(
            children: <Widget>[
              Image.asset('assets/images/mapicon.png'),
              Text("Map",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        )
      )
    ];
  }

  List<Widget> _buildClasses() {
    return [
      Padding(
        padding: EdgeInsets.only(right: 0),
        child: Container(
          // Constraints
          width: 75,
          height: 95,
          alignment: Alignment.center,

          // Decoration
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),

          child: Column(
            children: <Widget>[
              Image.asset('assets/images/classesicon.png'),
              Text("Classes",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        )
      )
    ];
  }

}
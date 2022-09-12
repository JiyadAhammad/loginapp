import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testingg/Login/login.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
        actions: [
          IconButton(
              onPressed: () {
                showAlertDialog(context);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) => 
            ListTile(
                title: Text(titleNames[index]),
                subtitle: Text(messageTitle[index]),
                trailing: Icon(Icons.keyboard_arrow_right),
                leading: Container(
        
                  height: 80,
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(digitalProfile[index]),fit: BoxFit.fill),
                    border: Border.all(color: Colors.black),
                    borderRadius: index % 2 == 0
                        ? BorderRadius.circular(100.0)
                        : BorderRadius.circular(1.0),
                  ),
                )
                // leading: CircleAvatar(
                //   radius: 30,
                //   backgroundImage: AssetImage('asset/image/fluutr.png'),
                // ),
                ),
            separatorBuilder: (ctx, index) => 
            Divider(
                  thickness: 3,
                  height: 20,
                ),
            itemCount: 30),
      ),
    );
  }

  buttonSignOut(BuildContext contxt) async {
    final _sharedpreferen = await SharedPreferences.getInstance();
    await _sharedpreferen.clear();

    Navigator.of(contxt).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => loginScreen()), (route) => false);
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget okButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        buttonSignOut(context);
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Do you Want to Exit?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final titleNames = [
    'Arun','Amal','Arjun','Afthash','Ajith',
    'Anas','Adarsh','jiyad','Shambu','Jasim',
    'Faisal','Amal','Arjun','Afthash','Ajith',
    'Anas','Adarsh','jiyad','Shambu','Jasim',
    'Faisal','Amal','Arjun','Afthash','Ajith',
    'Anas','Adarsh','jiyad','Shambu','Jasim',
  ];

  //    final icons = [Icons.directions_bike, Icons.directions_boat,
  // Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
  // Icons.directions_run, Icons.directions_subway, Icons.abc_rounded,
  // Icons.directions_walk,Icons.directions_bike, Icons.directions_boat,
  // Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
  // Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
  // Icons.directions_walk,Icons.directions_bike, Icons.directions_boat,
  // Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
  // Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
  // Icons.directions_walk,Icons.directions_bike, Icons.directions_boat,
  // Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
  // Icons.directions_run, ];

  final digitalProfile = [
    'asset/image/img1.jpg','asset/image/img2.jpg','asset/image/img3.jpg',
    'asset/image/img4.jpg','asset/image/img5.jpg','asset/image/img1.jpg',
    'asset/image/img2.jpg', 'asset/image/img3.jpg', 'asset/image/img4.jpg',
    'asset/image/img5.jpg','asset/image/img1.jpg','asset/image/img2.jpg',
    'asset/image/img3.jpg','asset/image/img4.jpg','asset/image/img5.jpg',
    'asset/image/img1.jpg', 'asset/image/img2.jpg','asset/image/img3.jpg',
    'asset/image/img4.jpg','asset/image/img5.jpg','asset/image/img1.jpg',
    'asset/image/img2.jpg','asset/image/img3.jpg','asset/image/img4.jpg',
    'asset/image/img5.jpg','asset/image/img1.jpg','asset/image/img2.jpg',
    'asset/image/img3.jpg','asset/image/img4.jpg','asset/image/img5.jpg',
  ];

  final messageTitle = [
    'hai','hallo','how are you','Flutter Developer','keep Smile',
    'hai','hallo','how are you','Flutter Developer','keep Smile',
    'hai','hallo','how are you','Flutter Developer','keep Smile',
    'hai','hallo','how are you','Flutter Developer','keep Smile',
    'hai','hallo','how are you','Flutter Developer','keep Smile',
    'hai','hallo','how are you','Flutter Developer','keep Smile',
    ];

}

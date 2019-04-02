import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication.dart';
import 'package:flutter_app/PhotoUpload.dart';

class Homepage extends StatefulWidget
{
  Homepage({
    this.auth,
    this.onSignedOut,
  });

  final AuthImplementation auth;
  final VoidCallback onSignedOut;


  @override
  State<StatefulWidget> createState()
  {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage>
{
  //Methods
  void _logOutuser() async{
    try{
      await widget.auth.signOut();
      widget.onSignedOut();
    }catch(err){
      print(err.toString());
    }
  }


  //create
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Container(

      ),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.pink,
        child: new Container(
          margin: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 15.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.local_car_wash,size: 40.0, color: Colors.white,),
                  onPressed: _logOutuser),
              new IconButton(
                  icon: new Icon(Icons.add_a_photo,size: 40.0, color: Colors.white,),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new UploadPhoto();
                    }));
                  }),

            ],
          ),
        ),
      ),
    );
  }
  
}
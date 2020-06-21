import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final  _unitController =TextEditingController();
  var _result ='';
  var _isKM =false;
  var _unitLable= 'convert from MM to KM';

  void _convertUnit(){
 if(_unitController.text.isEmpty){
          return;
      }
setState(() {
  if(_unitLable== 'convert from MM to KM'){
      _result='${int.parse(_unitController.text)/ 1000000}';
  }
  else{
    _result='${int.parse(_unitController.text)* 1000000}';
  }

});  
  }
  
  void swapUnites(){
if (_isKM){
 setState(() {
    _unitLable= 'convert from MM to KM';
    _isKM =false;
  });
}else {
  setState(() {
    _unitLable= 'convert from KM to MM';
    _isKM =true;
  });
 
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('unit convaert'),),
       body:
        SingleChildScrollView(
                  child: Column(children: <Widget>[ 
           SizedBox(height: 25,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
           Text(
             _unitLable,
               style:TextStyle(fontSize:20, color: Colors.green),
             ),
             FlatButton.icon(onPressed: swapUnites, icon:Icon(Icons.swap_calls), label: Text('Swap'))
           ],),
        
           Padding(
             padding: const EdgeInsets.all(15),
             child: TextField(
               decoration: InputDecoration(
                  labelText: 'Unit in MM',
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15),
                 )),
                 onSubmitted: (value){
                 _convertUnit();
                 },
               maxLength: 18,
              keyboardType: TextInputType.number,
               controller:_unitController,
             ),
           ),
  RaisedButton(
    child: Text('Convert',style: TextStyle(color: Colors.white)),
    color: Theme.of(context).primaryColor,
    onPressed: _convertUnit,
  ), 
  SizedBox(height: 20,),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Text('Result : '),
    Text(_result),
  ],),
  
  FlatButton(
    child: Text('Clear',style: TextStyle(fontSize: 22, color: Theme.of(context).accentColor),)
    ,  onPressed: (){
setState(() {
  _result='';
  _unitController.text='';
});
  },)
       ],
       ),
        ),
    );
  }
}
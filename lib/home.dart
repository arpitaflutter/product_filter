import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  double slide = 1000;

  List name = [
    "TV","Refrigerator","Mobile","Purse","Iphone","Washing machine","Laptop","Computer","Heater","Oven","Mixture","Apple watch"
  ];

  List price = [
    "15000","25000","15000","5000","85000","17000","55000","37000","20000","35000","2500","60000"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Poducts Filter"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Slider(
                value: slide,
                onChanged: (value) {
                  setState(() {
                    slide = value;
                  });
                },
              activeColor: Colors.blue,
              divisions: 10,
              inactiveColor: Colors.lightBlue,
              label: "Range",
              max: 100000,
              min: 1000,
            ),
            Center(child: Text("Products less than Rs.$slide",style: TextStyle(fontSize: 25,color: Colors.indigo,fontWeight: FontWeight.bold),)),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return slide>=int.parse(price[index])?viewTile(name[index], price[index]):SizedBox();
                },
                itemCount: name.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewTile(String n1,String p1)
  {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 100,width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blueGrey.shade900,width: 5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$n1:",style: TextStyle(color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold,fontSize: 20),),
            Text("$p1",style: TextStyle(color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold,fontSize: 20),),
          ],
        ),
      ),
    );
  }

}

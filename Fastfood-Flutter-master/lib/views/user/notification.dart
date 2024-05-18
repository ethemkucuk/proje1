
import 'package:fastfood/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../utils/CommonColors.dart';
import '../../utils/local_images.dart';

class Notifications extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Notifications();
}

class _Notifications extends State <Notifications>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.white,flexibleSpace: Container(
        padding: EdgeInsets.only(top:30.0,right: 20.0,left: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){ Navigator.pop(context);},
              child: Image.asset(LocalImages.ic_back,width: 50.0,height: 50,fit: BoxFit.fitWidth,),
            ),
            const Text(AppConstants.notification,style: TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index)=>Divider(),
          itemCount: 6,
            itemBuilder: (BuildContext context, int index){
              return InkWell(
                onTap: (){},
                child: const ListTile(
                  leading: Icon(Icons.notifications_active_outlined,size: 20,color: CommonColors.primaryColor,),
                  title: Text('Order has been completed.',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:CommonColors.primaryTextColor)),
                  subtitle: Text('Hi, Your order has been completed successfully',style: TextStyle(fontSize:10,color:CommonColors.primaryTextColor)),
                  trailing: Text('1 hour ago',style: TextStyle(fontSize:10,color:CommonColors.primaryTextColor)),
                ),
              );
            }
        ),
      ),
    );
  }
}

import 'package:fastfood/utils/local_images.dart';
import 'package:fastfood/views/payment_mode.dart';
import 'package:flutter/material.dart';
import '../../utils/CommonColors.dart';
import '../../utils/constant.dart';

class AddressView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddressView();
}

class _AddressView extends State<AddressView>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Colors.white, flexibleSpace: Container(
          padding: EdgeInsets.only(top: 30.0, right: 20.0, left: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Image.asset(LocalImages.ic_back, width: 50.0, height: 50, fit: BoxFit.fitWidth,),
              ),
              const Text(AppConstants.address, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20.0),
            child: ListView(
              children: [
                Text('Deliver To', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: CommonColors.primaryTextColor)),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    tileColor: Colors.grey.shade100,
                    leading:CircleAvatar(child: Icon(Icons.location_on_outlined,),backgroundColor: Colors.grey.shade200,),
                    title: Text('Home', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: CommonColors.primaryTextColor)),
                    subtitle: Text('700 Plymouth Ave S,Rochester,North Dakota,United States', style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                  ),
                ),
                Divider(color: Colors.grey.shade300,),
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    tileColor: Colors.grey.shade100,
                    leading:CircleAvatar(child: Icon(Icons.location_on_outlined,),backgroundColor: Colors.grey.shade200,),
                    title: Text('Office', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: CommonColors.primaryTextColor)),
                    subtitle: Text('21740 S Tamiami Trail #103, Estero, Florida, United States', style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                  ),
                ),
                SizedBox(height: 50,),
                Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentView()),);
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width - 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: CommonColors.primaryColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: const Text('Use this address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                )
              ],
            )
        )
    );

  }
}
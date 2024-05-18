
import 'package:fastfood/utils/local_images.dart';
import 'package:fastfood/views/address_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/globalCart.dart';
import '../../models/home_model.dart';
import '../../utils/CommonColors.dart';
import '../../utils/constant.dart';

class BottomCartView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BottomCartView();
}

class _BottomCartView extends State <BottomCartView>{

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<HomeModel>(context).products;
    HomeModel homeModel=Provider.of<HomeModel>(context);
    Cart cartProvider=Provider.of<Cart>(context);
    int subtotal = 0;
    int deliveryCharge = 30;
    double gst=0;

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
            const Text(AppConstants.cart,style: TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
          ],
      ),
        ),
      ),
      body: Consumer<Cart>(builder:(context,carts,_)
        {
          double calculateTotal() {
            double subtotal = 0;
            for (var item in carts.cartList) {
              String priceString = (item.price).toString();
              String qtyString = (item.quantity).toString();
              double price = double.tryParse(priceString) ?? 0;
              double qty = double.tryParse(qtyString) ?? 0;
              subtotal += price * qty;
            }
            deliveryCharge = 30;
            double grandTotal = subtotal + deliveryCharge;
            return grandTotal;
          }
          return Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: carts.cartList.length>0?ListView(
            children: [
              Container(
                height: carts.cartList.length*88,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index)=>Container(margin:EdgeInsets.symmetric(horizontal:20),child: Divider()),
                    itemCount: carts.cartList.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index){
                      return  Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(LocalImages.dish,width: 80.0,),
                           Column(
                             children: [
                               Text('${carts.cartList[index].name}',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:CommonColors.primaryTextColor)),
                               Text('${carts.cartList[index].quantity}X${carts.cartList[index].price}',style: TextStyle(fontSize:10,color:CommonColors.primaryTextColor)),
                             ],

                           ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: CommonColors.primaryTextColor,
                                 borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap:(){
                                      carts.updateItemQuantity(index, carts.cartList[index].quantity + 1);
                                    },
                                    child:Icon(Icons.add,color: Colors.white,) ,),
                                 SizedBox(width: 5,),
                                  Text( carts.cartList[index].quantity.toString(),style: TextStyle(color:  Colors.white),),
                                  SizedBox(width: 5,),
                                  InkWell(onTap: (){
                                    carts.updateItemQuantity(index, carts.cartList[index].quantity - 1);
                                    if (carts.cartList[index].quantity == 0) {
                                      carts.cartList[index].isAdded = false;
                                      carts.removeItem(index);
                                    }
                                    setState(() {});
                                  },child:
                                  Icon(Icons.remove,color:  Colors.white,) ,)

                                ],
                              ),
                            ),

                            Text('₹${carts.cartList[index].price*carts.cartList[index].quantity}',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:CommonColors.primaryTextColor)),

                          ],
                        )
                      );
                    }
                ),
              ),
              Container(margin:EdgeInsets.symmetric(horizontal:20),child: Divider()),
              Container(
                padding: EdgeInsets.only(right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('SubTotal: ₹${subtotal.toString()}', style: TextStyle(fontSize: 14,color: Colors.grey.shade700)),
                      SizedBox(height: 3.0,),
                      Text('Delivery charge: ₹30.00', style: TextStyle(fontSize: 14, color: CommonColors.primaryTextColor)),
                      SizedBox(height: 3.0,),
                      Text('Tax(GST): ₹$gst', style: TextStyle(fontSize: 14, color: CommonColors.primaryTextColor)),
                      SizedBox(height: 5.0,),
                      Container(margin:EdgeInsets.only(left: MediaQuery.of(context).size.width/1.6),child: Divider()),
                      Text('Total: ₹${calculateTotal().toString()}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CommonColors.primaryTextColor)),
                    ],
                  )
              ),
              SizedBox(height: 40.0,),
              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddressView()),);
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width-100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: CommonColors.primaryColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Text('Proceed to checkout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Colors.white)),
                  ),
                ),
              )
            ],
          ):
          Center(
            child: Text('There is no any item in cart. Please add an item',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          ),
        );
      },)
    );
  }
}
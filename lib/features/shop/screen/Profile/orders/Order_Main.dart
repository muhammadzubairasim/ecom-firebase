import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class Order_Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppbar( customTitle: Text("My Orders") ,  backArrow: true,
      ),
      body: ListView(
        children: [
          _buildOrderItem(
            status: "Processing",
            date: "01 Sep 2023",
            orderNumber: "CWT0012",
            shippingDate: "09 Sep 2023",
          ),
          _buildOrderItem(
            status: "Shipment on the way",
            date: "02 Oct 2023",
            orderNumber: "CWT0025",
            shippingDate: "06 Oct 2023",
          ),
          _buildOrderItem(
            status: "Delivered",
            date: "03 Nov 2023",
            orderNumber: "CWT0152",
            shippingDate: "08 Nov 2023",
          ),
          _buildOrderItem(
            status: "Delivered",
            date: "20 Dec 2023",
            orderNumber: "CWT0265",
            shippingDate: "25 Dec 2023",
          ),
          _buildOrderItem(
            status: "Delivered",
            date: "25 Dec 2023",
            orderNumber: "CWT1536",
            shippingDate: "01 Jan 2024",
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required String status,
    required String date,
    required String orderNumber,
    required String shippingDate,
  }) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45 ),
          borderRadius: BorderRadius.circular(10)
        ),
        margin: EdgeInsets.all(TSizes.defaultSpace/2),
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace)  ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text("Order Date" ,style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,), ),
                  SizedBox(height: 3.0),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text("Order #" ,style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,), ),
                  SizedBox(height: 3.0),
                  Text(
                    "Order: $orderNumber",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(height: 8.0 , width: 5.0, ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "shipping Date",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        shippingDate,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
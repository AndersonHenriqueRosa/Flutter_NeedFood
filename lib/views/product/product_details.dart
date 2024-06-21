import 'package:flutter/material.dart';
import 'package:need_food/common/my_style.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded, 
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  "assets/img/food-2.png",
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Beef Burger",
                    style: MyStyle.boldTextFeilStyle(),
                  ),
                  Text(
                    "IDR 20k",
                    style: MyStyle.priceTextFeilStyle(),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Beef Burger",
                    style: MyStyle.boldTextFeilStyle(),
                  ),
                  Text(
                    "IDR 20k",
                    style: MyStyle.priceTextFeilStyle(),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                "A delicious and juicy beef burger topped with fresh ingredients.",
                style: MyStyle.lightTextFeilStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:book_shop/theme/colors.dart';
import 'package:flutter/material.dart';
import 'avatar_image.dart';

class BookItem extends StatelessWidget {
  BookItem({ Key? key, required this.book }) : super(key: key);
  final book;

  @override
  Widget build(BuildContext context) {
    double _width = 80, _height = 110;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 50, right: 40),
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  width: _width/2,
                  height: _height/2,
                  decoration: BoxDecoration(
                  color: Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                ),
                )
              ),
              Container(
                width: _width, height: _height,
                padding: EdgeInsets.all(8),
                child: AvatarImage(book["image"]!,
                  isSVG: false,
                  radius: 8,
                ),
              )
            ]
          ),
          SizedBox(width: 18,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(book["title"], style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
              SizedBox(height: 12,),
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: book["price"], style: TextStyle(fontSize: 16, color: primary ,fontWeight: FontWeight.w500)),
                  TextSpan(text: "   "),
                  TextSpan(text: book["ori_price"], 
                    style: TextStyle(color: Colors.grey, fontSize: 16, 
                      decoration: TextDecoration.lineThrough, 
                      fontWeight: FontWeight.w500)
                  ),
                ]
              ))
            ],
          )
        ],
      )
    );
  }
}
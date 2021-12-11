import 'dart:math';

import 'package:book_shop/theme/colors.dart';
import 'package:flutter/material.dart';

import 'avatar_image.dart';

class BookCard extends StatelessWidget {
  BookCard({ Key? key, required this.book}) : super(key: key);
  final book;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 255,
        margin: EdgeInsets.only(right: 25),
        padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: AvatarImage(book["image"],
                  width: 80, height: 100, isSVG: false,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text(book["title"], 
              maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 16, color: primary ,fontWeight: FontWeight.w600)
            ),
            SizedBox(height: 8,),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(text: book["price"], style: TextStyle(fontSize: 16, color: primary ,fontWeight: FontWeight.w500)),
                  TextSpan(text: "   "),
                  TextSpan(text: book["ori_price"], 
                    style: TextStyle(color: Colors.grey, fontSize: 16, 
                      decoration: TextDecoration.lineThrough, 
                      fontWeight: FontWeight.w500)
                  ),
                ]
              )
            )
          ],
        ),
      );
  }
}
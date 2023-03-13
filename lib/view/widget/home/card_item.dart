import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.8,
          mainAxisSpacing: 9,
          crossAxisSpacing: 6,
          maxCrossAxisExtent: 200,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return buildCardItem();
        },
      ),
    );
  }

  Widget buildCardItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  )),
            ],
          ),
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Image.network(
              'https://images.unsplash.com/photo-1670272498380-eb330b61f3cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "\$20",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 45,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: mainColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 3,right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtils(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        text: '4.6',
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                     Icon(Icons.star,size: 13,color: Colors.white,),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

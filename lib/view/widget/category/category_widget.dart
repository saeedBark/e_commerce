import 'package:e_commerce/view/widget/category/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
                Get.to(() => CategoryItem());
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1679926591722-79bff79c561a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 10),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'menu',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          backgroundColor: Colors.black38),
                    )),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: 7,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

class ProductWidget extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final String price;

  ProductWidget({this.image, this.name, this.desc, this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.5),
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
                  style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  price,
                  style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "VNĐ",
                  style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.add),
                    Container(
                        width: 70,
                        child: TextField(
                            style: TextStyle(
                                fontSize: 17,
                                height: 1.0,
                                color: Colors.black,
                            ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: false, signed: false),
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ''
                          ),
                        ),
                    ),
                    Icon(Icons.remove)
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

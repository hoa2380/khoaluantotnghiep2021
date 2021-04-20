import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khoaluantotnghiep2021/controller/home/laundry_service/laundry_service_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';

class LaundryService extends GetView<LaundryServiceController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child : laundry()
        )
      ],
    );
  }

  Widget laundry() {
    return Obx(() {
      if (controller.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return GridView.builder(
            shrinkWrap: true,
            itemCount: controller.laundryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 5,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.2),
                        spreadRadius: 6,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ]),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        '${AppEndpoint.BASE_URL_IMAGE}' +
                            controller.laundryList[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.laundryList[index].name,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 25),
                            ),
                            Text(
                              controller.laundryList[index].description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18),
                            ),
                            Text(
                              NumberFormat.decimalPattern()
                                  .format(controller.laundryList[index].pricing) +
                                  "₫",
                              style: TextStyle(
                                  color: Colors.red[700], fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.remove,
                            size: 28,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 28),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.add,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              );
            });
    });
  }
}

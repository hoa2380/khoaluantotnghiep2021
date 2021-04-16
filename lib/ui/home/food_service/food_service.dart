import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';

class FoodService extends GetView<FoodServiceController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: DefaultTabController(
            length: 5,
            child: TabBar(
              controller: controller.tabController,
              isScrollable: true,
              unselectedLabelColor: AppColors.primaryTextColor,
              labelStyle: TextStyle(fontSize: 18),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.primaryAccentColor,
                    AppColors.primaryColor
                  ]),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent),
              tabs: controller.serviceTabs,
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                mustTry(),
                mustTry(),
                mustTry(),
                mustTry(),
                mustTry(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget mustTry() {
    return Obx(() {
      if (controller.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return GridView.builder(
            shrinkWrap: true,
            itemCount: controller.foodList.length,
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
                            controller.foodList[index].imagePath,
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
                              controller.foodList[index].name,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 25),
                            ),
                            Text(
                              controller.foodList[index].description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18),
                            ),
                            Text(
                              NumberFormat.decimalPattern()
                                  .format(controller.foodList[index].pricing) +
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

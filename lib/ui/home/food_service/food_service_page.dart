import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:khoaluantotnghiep2021/ui/widgets/dot.dart';
import 'package:khoaluantotnghiep2021/ui/widgets/modal_fit.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

// ignore: must_be_immutable
class FoodServicePage extends GetView<FoodServiceController> {
  double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(() {
        if (controller.isCategoryLoading.value && controller.isLoading.value)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: DefaultTabController(
                  length: controller.cateList.length,
                  initialIndex: 0,
                  child: TabBar(
                    onTap: (index) {
                      if(controller.cateList[index].id == 0){
                        controller.getFoodList();
                      } else if(controller.cateList[index].id == 1) {
                        controller.getPromoList();
                      } else {
                        controller.getFoodListByCat(controller.cateList[index].id);
                      }
                    },
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    controller: controller.tabController,
                    tabs: controller.cateList.map((element) => Tab(text: element.name.toUpperCase(),)).toList(),
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
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.tabController,
                    children: controller.cateList.map((element){
                      return itemList();
                    }).toList(),
                  ),
                ),
              )
            ],
          );
      }),
      floatingActionButton: Obx(() {
        if (controller.isVisible.value)
          return Container();
        else
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
            child: FloatingActionButton(
              onPressed: () => openCart(context),
              child: Badge(
                animationDuration: Duration(milliseconds: 300),
                elevation: 1.0,
                animationType: BadgeAnimationType.slide,
                position: BadgePosition.topEnd(top: -18, end: -14),
                badgeContent: Text(
                  "${controller.totalCount}",
                  style: TextStyle(fontSize: 18, color: AppColors.iconColor),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: AppColors.iconColor,
                ),
              ),
            ),
          );
      }),
    );
  }

  Widget itemList() {
    return Obx(() => GridView.builder(
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
                  child: Container(
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image.network(
                        '${AppEndpoint.BASE_URL_IMAGE}' +
                            controller.foodList[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                        controller.foodList[index].discount.value == 0 ?
                        Text(
                          NumberFormat.decimalPattern().format(
                              controller.foodList[index].pricing) +
                              "₫",
                          style: TextStyle(
                              color: Colors.red[700], fontSize: 18),
                        ) :
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              NumberFormat.decimalPattern().format(
                                  controller.foodList[index].pricing) +
                                  "₫",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.red[700], fontSize: 18),
                            ),
                            Text(
                              NumberFormat.decimalPattern().format(
                                  controller.foodList[index].discount.value) +
                                  "₫",
                              style: TextStyle(
                                  color: Colors.red[700], fontSize: 18),
                            ),
                          ],
                        )
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
                      onTap: () {
                        controller.decreaseCount(index);
                        controller.calculateTotal();
                      },
                      child: Icon(
                        Icons.remove,
                        size: 28,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Obx(
                          () => Text(
                        '${controller.foodList[index].qty}',
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 28),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.increaseCount(index);
                        controller.addItem(controller.foodList[index]);
                        controller.calculateTotal();
                      },
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
        }));
  }

  openCart(BuildContext context) {
    showCupertinoModalBottomSheet(
        duration: Duration(milliseconds: 400),
        context: context,
        builder: (context){
          return ModalFit(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Food Detail",
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            NumberFormat.decimalPattern()
                                .format(controller.totalCartValue) +
                                "₫",
                            style: TextStyle(
                              fontSize: 23,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      child: ListView.builder(
                          primary: true,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.foodCartItem.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.network(
                                '${AppEndpoint.BASE_URL_IMAGE}' +
                                    controller.foodCartItem[index].imagePath,
                                fit: BoxFit.cover,
                                width: 70,
                              ),
                              title: Text(
                                controller.foodCartItem[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'x',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: AppColors.primaryTextColor,
                                        )),
                                    TextSpan(
                                        text:
                                        '${controller.foodCartItem[index].qty}',
                                        style: TextStyle(
                                          fontSize: 23,
                                          color: AppColors.primaryTextColor,
                                        )),
                                  ],
                                ),
                              ),
                              trailing: Text(
                                NumberFormat.decimalPattern().format(
                                    controller.foodCartItem[index].pricing) +
                                    "₫",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryTextColor,
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Note",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryTextColor,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          TextField(
                            controller: controller.textNote,
                            autofocus: false,
                            onChanged: (value) => controller.note = value,
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primaryTextColor),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Add note for this cart',
                              hintStyle: TextStyle(
                                  color: Colors.black38
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.black45),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Container(
                      height: height * 0.07,
                      width: width * 0.5,
                      child: TextButton(
                        child: Text('PROCESS ORDER'),
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 18,
                          ),
                          primary: Colors.white,
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          Get.back();
                          signatureDialog(context);
                        },
                      ),
                    )
                  ],
                ),
              )
          );
        });
  }

  signatureDialog(BuildContext context) {
    if(Platform.isAndroid)
      showDialog(
          context: context,
          builder: (context){
            return CupertinoAlertDialog(
              insetAnimationDuration: Duration(milliseconds: 400),
              title: Text(
                'please sign to confirm'.toUpperCase(),
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              content: Obx(() =>
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,),
                      Container(
                        height: height * 0.35,
                        child: Stack(
                          children: [
                            SfSignaturePad(
                                onSignStart: () => controller.isClearVisible(false),
                                key: controller.signatureGlobalKey,
                                backgroundColor: Colors.white,
                                strokeColor: controller.currentColor.value,
                                minimumStrokeWidth: 2.0,
                                maximumStrokeWidth: 3.0),
                            !controller.isClearVisible.value ? Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () => controller.clearSign(),
                                child: Icon(
                                  Icons.cancel,
                                  color: Colors.black26,
                                  size: 35,),
                              ),
                            ) : Container(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,),
                      Container(
                        height: height * 0.05,
                        width: width * 1,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Icon(Icons.palette_outlined, color: controller.currentColor.value, size: 35,),
                            GestureDetector(
                              onTap: () => controller.changeStrokeColor(Colors.black),
                              child: DotWidget(
                                size: 16,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.changeStrokeColor(Colors.blueAccent),
                              child: DotWidget(
                                size: 16,
                                color: Colors.blueAccent,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.changeStrokeColor(Colors.lightGreenAccent),
                              child: DotWidget(
                                size: 16,
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.changeStrokeColor(Colors.orangeAccent),
                              child: DotWidget(
                                size: 16,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.changeStrokeColor(Colors.redAccent),
                              child: DotWidget(
                                size: 16,
                                color: Colors.redAccent,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.changeStrokeColor(Colors.purpleAccent),
                              child: DotWidget(
                                size: 16,
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              actions: [
                Container(
                  height: height * 0.05,
                  child: TextButton(
                    child: Text('ORDER'),
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                      primary: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      controller.uploadImg();
                      Get.back();
                    },
                  ),
                ),
              ],
            );
          });
    else
      Get.defaultDialog();
  }

}
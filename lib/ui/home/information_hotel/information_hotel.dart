
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:khoaluantotnghiep2021/controller/home/infor_hotel/infor_controller.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';


class InformationHotel extends StatefulWidget {
  @override
  _InformationHotelState createState() => _InformationHotelState();
}

class _InformationHotelState extends State<InformationHotel> {
  InforController inforController = Get.put(InforController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => inforActivity(),
        'detail': (context) => hotelInforDetail("")
      },
    );
  }

  Widget inforActivity() {
    return Obx(() {
      if (inforController.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: inforController.inforList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => hotelInforDetail(
                                    '${AppEndpoint.BASE_URL_IMAGE}' +
                                        inforController
                                            .inforList[index].imagePaths
                                            .replaceAll('["', "")
                                            .replaceAll('"]', ""))));
                      },
                      child: Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 2),
                                ),
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              '${AppEndpoint.BASE_URL_IMAGE}' +
                                  inforController.inforList[index].avatar,
                            ),
                          )),
                    );
                  }),
            )
          ],
        );
    });
  }

  hotelInforDetail(detail) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Image.network(
              detail,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

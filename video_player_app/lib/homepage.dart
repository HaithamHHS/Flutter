import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:video_player_app/video_info.dart';
import 'colors.dart' as color;
import 'package:get/get.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List info = [];
  _initDate() {
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initDate();
    print(info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Trainning',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: color.AppColor.homePageTitle),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.calendar_today_outlined,
                    size: 20, color: color.AppColor.homePageIcons),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_forward,
                    size: 20, color: color.AppColor.homePageIcons),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Your Program',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: color.AppColor.homePageSubtitle),
                ),
                Expanded(child: Container()),
                Text(
                  'Details',
                  style: TextStyle(
                      fontSize: 20, color: color.AppColor.homePageDetail),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => Video_info());
                  },
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    size: 15,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight,
                      colors: [
                        color.AppColor.gradientFirst.withOpacity(0.9),
                        color.AppColor.gradientSecond.withOpacity(0.7)
                      ]),
                  boxShadow: [
                    BoxShadow(
                        color: color.AppColor.gradientFirst.withOpacity(0.5),
                        blurRadius: 15,
                        offset: Offset(4, 7)),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80))),
              child: Container(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next Workout',
                      style: TextStyle(
                          fontSize: 18,
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Legs Toning',
                      style: TextStyle(
                          fontSize: 25,
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'And Glutes Workout',
                      style: TextStyle(
                          fontSize: 25,
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Icon(
                          Icons.play_circle_fill_rounded,
                          size: 60,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '60 mins',
                          style: TextStyle(
                              color: color.AppColor.homePageContainerTextSmall),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              margin: const EdgeInsets.only(top: 30),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              offset: Offset(8, 8),
                              color: color.AppColor.gradientSecond),
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(-5, -1),
                              color: color.AppColor.gradientSecond)
                        ],
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: AssetImage('assets/card.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 235, bottom: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/figure.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 160, top: 15, right: 20),
                    width: double.maxFinite,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are Doing Great !',
                          style: TextStyle(
                              color: color.AppColor.homePageDetail,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'keep the hard work\n',
                                style: TextStyle(
                                    color: color.AppColor.homePagePlanColor),
                                children: [TextSpan(text: 'Dont stop !')]))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Area Of Focus : ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: info.length,
              itemBuilder: (_, i) {
                return Container(
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Center(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          info[i]['title'],
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                  ),
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(5, 5),
                            color: color.AppColor.gradientSecond),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      image:
                          DecorationImage(image: AssetImage(info[i]['image']))),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

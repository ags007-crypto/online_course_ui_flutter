import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_ui/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:online_course_ui/course_detail_screen.dart';
import 'package:online_course_ui/modal/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/icons/menu.svg",
                height: 30,
              ),
              Image.asset(
                "assets/images/profilepic.jpg",
                height: 50,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Hey Jack,",
            style: kHeadingTextStyle,
          ),
          Text(
            "Find a course you want to learn",
            style: kSubheadingTextStyle.copyWith(color: Color(0xFF6E8AFA)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40)),
            child: Row(children: [
              SvgPicture.asset(
                "assets/icons/search.svg",
                height: 20,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Search for anything",
                style: TextStyle(fontSize: 18, color: Color(0xFFA0A5BD)),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category",
                style: kTitleTextStyle,
              ),
              Text(
                "See All",
                style: kSubtitleTextStyle.copyWith(color: kBlueColor),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: GridView.custom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    pattern: [
                      WovenGridTile(1),
                      WovenGridTile(
                        5 / 7,
                        crossAxisRatio: 1,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate:
                      SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          if (index == 1) {
                            return DetailsScreen();
                          } else {
                            return HomeScreen();
                          }
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: AssetImage(categories[index].image),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 10,
                                  color: Colors.grey.withOpacity(.50))
                            ]),
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                  color: kBlueColor.withOpacity(.7)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 8, bottom: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        categories[index].name,
                                        style: kTitleTextStyle.copyWith(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                      Text(
                                        '${categories[index].numOfCourses} Courses',
                                        style: TextStyle(
                                            color: Colors.white.withOpacity(.6),
                                            fontSize: 13),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, childCount: categories.length))),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_ui/constants.dart';
import 'package:online_course_ui/main.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 251, 231),
        body: Stack(children: [
          Container(
            child: coverpic(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                        },
                        child: SvgPicture.asset(
                          "assets/icons/backarrow.svg",
                          height: 20,
                        ),
                      ),
                      SvgPicture.asset("assets/icons/dotmenu.svg")
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ClipPath(
                      clipper: BestSellerClipper(),
                      child: Container(
                        color: kBestSellerColor,
                        padding: EdgeInsets.only(
                            left: 10, top: 5, bottom: 5, right: 20),
                        child: Text(
                          "BestSeller".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "UX Design",
                    style: kHeadingTextStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/people.svg",
                        height: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("21K"),
                      SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        height: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("4.8")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "₹3499 ",
                      style: kHeadingTextStyle.copyWith(fontSize: 32),
                    ),
                    TextSpan(
                        text: "₹5500",
                        style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                            decoration: TextDecoration.lineThrough))
                  ]))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 370),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Course Content",
                  style: kTitleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 60, left: 15, right: 15, bottom: 50),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 40,
                    ),
                    CourseContent(
                        number: "01",
                        duration: 6.45,
                        title: "Welcome to the Course",
                        isDone: true),
                    CourseContent(
                        number: "02",
                        duration: 5.35,
                        title: "Why UX?",
                        isDone: true),
                    CourseContent(
                        number: "03",
                        duration: 7.35,
                        title: "Design Thinking Process",
                        isDone: false),
                    CourseContent(
                        number: "04",
                        duration: 4.30,
                        title: "Figma Basics",
                        isDone: false),
                    CourseContent(
                        number: "05",
                        duration: 7.40,
                        title: "Prototype",
                        isDone: false),
                    CourseContent(
                        number: "06",
                        duration: 9.25,
                        title: "Portfolio Development",
                        isDone: false),
                    SizedBox(
                      height: 100,
                    )
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.white.withOpacity(1),
                      Colors.white.withOpacity(0)
                    ])),
              ),
              Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 50,
                              color: kTextColor.withOpacity(.16))
                        ]),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.all(14),
                        height: 56,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFEDEE),
                            borderRadius: BorderRadius.circular(40)),
                        child: SvgPicture.asset("assets/icons/cartt.svg"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.red),
                        child: Text(
                          "Buy Now",
                          style: kSubtitleTextStyle.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ))
                    ]),
                  ))
            ]),
          ),
        ]));
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;

  const CourseContent({
    Key? key,
    required this.number,
    required this.duration,
    required this.title,
    required this.isDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(.15)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                number,
                style: kHeadingTextStyle.copyWith(
                    color: kTextColor.withOpacity(.15), fontSize: 32),
              ),
              SizedBox(
                width: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "$duration mins\n",
                    style: TextStyle(
                        color: kTextColor.withOpacity(.5), fontSize: 18)),
                TextSpan(
                    text: title,
                    style: kSubtitleTextStyle.copyWith(
                        fontWeight: FontWeight.w600, height: 1.5))
              ])),
              Spacer(),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kGreenColor.withOpacity(isDone ? 1 : .5)),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class coverpic extends StatelessWidget {
  const coverpic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        alignment: Alignment.bottomRight,
        child: Image(
          image: AssetImage(
            "assets/images/elearn.png",
          ),
          height: 250,
        ));
  }
}

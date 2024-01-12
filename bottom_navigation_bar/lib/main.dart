import "package:bottom_navigation_bar/customWidget.dart";
import "package:convex_bottom_bar/convex_bottom_bar.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

void main() => runApp(MyApp());

BuildContext? testContext;

class MyApp extends StatelessWidget {
  var _controller = PersistentTabController();

  MyApp({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => MaterialApp(
        title: "Persistent Bottom Navigation Bar example project",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Container(),

          // // Using plugin
          // bottomNavigationBar: Container(
          //   height: MediaQuery.of(context).size.height / 8,
          //   width: MediaQuery.of(context).size.width,
          //   child: Stack(
          //     children: [
          //       Positioned(
          //         top: 10,
          //         child: Container(
          //           height: MediaQuery.of(context).size.height / 9,
          //           width: MediaQuery.of(context).size.width,
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.only(
          //               topLeft: Radius.circular(20),
          //               topRight: Radius.circular(20),
          //             ),
          //             child: ConvexAppBar(
          //               items: [
          //                 TabItem(icon: Icons.home, title: 'Home'),
          //                 TabItem(icon: Icons.map, title: 'Discovery'),
          //                 TabItem(
          //                   icon: Icons.add,
          //                   // title: 'Add', // Use a custom widget for the "Add" tab
          //                   // activeIcon: Icons.add,
          //                   // isIconBlend:
          //                   //     true, // Do not blend icon with background color
          //                   // //titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          //                 ),
          //                 TabItem(icon: Icons.message, title: 'Message'),
          //                 TabItem(icon: Icons.people, title: 'Profile'),
          //               ],
          //               //onTap: (int i) => print('click index=$i'),
          //               style: TabStyle.fixed,
          //             ),
          //           ),
          //         ),
          //       ),
          // Positioned(
          //   left: MediaQuery.of(context).size.width / 2.3,
          //   bottom: 13,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(30)),
          //     child: Padding(
          //       padding: const EdgeInsets.all(2.0),
          //       child: IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.add,
          //             size: 25,
          //             color: Colors.blue,
          //           )),
          //     ),
          //   ),
          // )
          //     ],
          //   ),
          // ),

          // // Custom one
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  //top: 0,
                  bottom: MediaQuery.of(context).size.height / 18,
                  right: MediaQuery.of(context).size.width / 13,
                  child: ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BottomNavItem(
                          text: "Home",
                          icon: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                        ),
                        BottomNavItem(
                          text: "Account",
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                        ),
                        BottomNavItem(
                          text: "Add",
                          icon: Icon(
                            Icons.add,
                            color: Colors.orange,
                          ),
                        ),
                        BottomNavItem(
                          text: "Message",
                          icon: Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                        ),
                        BottomNavItem(
                          text: "Rides",
                          icon: Icon(
                            Icons.car_crash_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 9,
                  left: MediaQuery.of(context).size.width / 2.4,
                  //bottom: 13,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange, // Set the border color
                          //width: 5.0, // Set the border width
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.orange,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Move to the starting point at the center-bottom
    path.moveTo(size.width / 4, size.height);

    // Draw a single upward wave at the top center with control points
    path.quadraticBezierTo(
        size.width / 2, size.height / 8, size.width, size.height);

    // Draw a straight line to the bottom-right
    path.lineTo(size.width / 4, size.height);

    // Draw a straight line to the bottom-left
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

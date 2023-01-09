import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hefish_finalproject/class/user.dart';
import 'package:hefish_finalproject/design/customListView.dart';
import 'package:hefish_finalproject/page/insertFishPage.dart';
import 'package:hefish_finalproject/page/loginPage.dart';
import '../class/color_palette.dart';
import '../class/fishes.dart';
import '../design/animatedPageRoute.dart';

// ignore: must_be_immutable
class FishesPage extends StatefulWidget {
  final User user;
  String collections;

  FishesPage(this.collections, {super.key, required this.user});

  @override
  State<FishesPage> createState() => _FishesPageState();
}

class _FishesPageState extends State<FishesPage> with TickerProviderStateMixin {
  late TabController tabController;
  List<Fishes> fishData = [];

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
    if (widget.collections == "Fresh Water") {
      tabController.animateTo(1);
    } else if (widget.collections == "Salt Water") {
      tabController.animateTo(2);
    } else if (widget.collections == "Brackish Water") {
      tabController.animateTo(3);
    } else if (widget.collections == "All Ecosystems") {
      tabController.animateTo(0);
    } else {
      tabController.animateTo(0);
    }

    fishData.add(Fishes(
        id: 13123,
        name: "Arwana Super Red",
        typeId: 1,
        typeName: "Fresh Water",
        authorId: 123,
        authorName: "Park Minyoung",
        price: "Rp500.000,00",
        imagePath: "assets/images/carousel/image 1.png",
        description: "Ikan mehong jangan digoreng nanti dipukul bapak."));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          floatingActionButton: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    color: Palette.accent,
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  ),
                ]),
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Palette.accent,
              onPressed: () {
                Navigator.of(context).push(AnimatedPageRoute(
                    child: InsertFishPage(
                  user: widget.user,
                )));
              },
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
          appBar: AppBar(
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Palette.background,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Palette.background,
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 30,
                            color: Palette.black,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Palette.black),
                          )
                        ],
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.popUntil(
                            context, (Route<dynamic> route) => route.isFirst);
                      },
                      icon: const Icon(
                        Icons.logout,
                        size: 30,
                        color: Palette.error,
                      ))
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 50.0),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 8, 15, 10),
                  child: TabBar(
                      controller: tabController,
                      unselectedLabelColor: Palette.grey,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Palette.accent,
                        boxShadow: const [
                          BoxShadow(
                            color: Palette.accent,
                            blurRadius: 2.5,
                            spreadRadius: 0,
                            offset: Offset(
                              0.0,
                              0.0,
                            ),
                          ),
                        ],
                      ),
                      tabs: const [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "All Eco",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Fresh",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Salt",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Brackish",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          body: TabBarView(controller: tabController, children: [
            Container(
              color: Palette.background,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: ListView.builder(
                    itemCount: fishData.length,
                    itemBuilder: (context, index) {
                      return CustomListView(item: fishData[index], user: widget.user,);
                    },
                  )),
            ),
            Container(
              color: Palette.background,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: ListView(
                    children: const [],
                  )),
            ),
            Container(
              color: Palette.background,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: ListView(
                    children: const [],
                  )),
            ),
            Container(
              color: Palette.background,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: ListView(
                    children: const [],
                  )),
            ),
          ]),
        ));
  }
}

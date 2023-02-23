import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_maker/study.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add.dart';
import 'category.dart';
import 'login/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController? animationController;
  late TextEditingController controller;
  String address = '은평구';
  int CategoryIdx = 0;
  final FirebaseAuth auth = FirebaseAuth.instance;


  @override
  void initState() {

    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    controller = TextEditingController();

    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //   color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getAppBarUI(),
            Divider(color: Colors.black),
            getPlaceUi(),
            getCategoryUi(),
            Expanded(
              child: getStudyUI(),
            ),
            
            


            /*
            Expanded(
              child: SingleChildScrollView(


                  child: Column(
                    children: <Widget>[
                      getStudyUI(),
                      getStudyUI(),
                      getStudyUI(),
                      getStudyUI(),
                      //   getSearchBarUI(),
                      //    getCategoryUI(),
                     /* Flexible(
                        child: getStudyUI(),
                      ),*/
                    ],
                  ),

              ),
            ),*/
          ],
        ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context, SlideUpRoute(page: AddPage(callback)));
            }, label: Text('개설하기'),
            icon: Icon(Icons.add),

          ),
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Choose your',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    //   color: DesignCourseAppTheme.grey,
                  ),
                ),
                Text(
                  'study group',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    //          color: DesignCourseAppTheme.darkerText,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: const Icon(Icons.search),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: const Icon(Icons.add_alert_rounded),
          ),
          IconButton(onPressed:(){ logOut();}, icon: Icon(Icons.logout))




        ],
      ),
    );
  }

  Widget getPlaceUi() {
    return Padding(
        padding: const EdgeInsets.only(top: 0, left: 18, right: 18),
        child: Row(children: <Widget>[
          Expanded(
              child: Row(children: [
            SizedBox(
              width: 60,
              height: 60,
              child: Icon(Icons.place_sharp),
            ),
            Text(address),
          ])),
          ElevatedButton(
              onPressed: () async {
                final address = await openDialog();
                log(address.toString());
                if (address == null || address.isEmpty) return;

                setState(() => this.address = address);
              },
              child: Text('동네변경')),
        ]));
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('동네변경'),
            content: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(hintText: '지역을 입력하세요.'),
            ),
            actions: [
              TextButton(
                child: Text('변경'),
                onPressed: submit,
              )
            ]),
      );

  void submit() {
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }

  Widget getCategoryUi() {
    return SizedBox(
        height: 70,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return buildCard(index);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
            itemCount: CategoryList.length));
  }

  Widget buildCard(int index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index == CategoryIdx ? Color(0xFF00B6F0) : Color(0xFFFFFFFF),
          border: Border.all(color: Color(0xFF00B6F0)),
        ),
        width: 150,
        height: 25,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                CategoryIdx = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  CategoryList[index],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: index == CategoryIdx
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF00B6F0),
                  ),
                ),
              ),
            ),
          ),
        ),
      );



  Widget getStudyUI() {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Center(child: buildStudyCard(context, Study.studyList[index]));
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 30);
        },
        itemCount: Study.studyList.length);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: new Container(
        height: 100,
        width: 100,
        color: Colors.blue,
      ),
    );
    /*Flexible(child:
    new ListView(
      scrollDirection: Axis.vertical,
      children: new List.generate(10, (int index) {
        return new Container(
          width: 100,
          height: 100,
          color: Colors.blue[index * 100],
          child: new Container(
            width: 50.0,
            height: 50.0,
            child: new Text("$index"),
          ),
        );
      },
      ),
    ),
    );*/
  }

  void callback(Study s){
    setState(() {
      Study.studyList.add(s);
    });
  }

  logOut() async {
    await auth.signOut();
    Navigator.pushNamed(context, LoginPage.id);
  }
}


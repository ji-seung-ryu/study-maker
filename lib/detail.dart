import 'package:study_maker/study.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, this.study}) : super(key: key);

  final Study? study;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool heart_check = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          getDetailAppBar(),
          getStudyTitle(),
          getStudyCategory(),
          Divider(color: Colors.grey),
          //getStudyFounder(),
          getStudyInfo(),
          Divider(color: Colors.grey),
          Expanded(child:
          getStudyDescription()
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: getDetailBottomBar(),
      ),
    );
  }

  Widget getDetailAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget getStudyTitle() {
    return Text(
      widget.study!.title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        letterSpacing: 0.27,
        //          color: DesignCourseAppTheme.darkerText,
      ),
    );
  }

  Widget getStudyCategory() {
    return Text(widget.study!.category,
        style: TextStyle(
          color: Colors.grey,
        ));
  }

  Widget getStudyInfo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Icon(Icons.account_box, size: 16),
            SizedBox(width: 5),
            Text(widget.study!.founder + ' 님')
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Icon(Icons.calendar_month, size: 16),
            SizedBox(width: 5),
            Expanded(
              child: Text(widget.study!.time),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.person, size: 16),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                    '${widget.study!.curPeople} / ${widget.study!.totalPeople}'),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.location_on_outlined, size: 16),
              SizedBox(width: 5),
              Expanded(
                child: Text('${widget.study!.place}'),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget getStudyDescription() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '동아리 소개 및 목표',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 0.27,
                //          color: DesignCourseAppTheme.darkerText,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.study!.goal),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '이런 분이 오셨으면 좋겠어요!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 0.27,
                //          color: DesignCourseAppTheme.darkerText,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.study!.who),
        ),
      ]),
    );
  }

  Widget getDetailBottomBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon:
                    Icon(heart_check ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    heart_check = !heart_check;
                  });
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('채팅하기'),
          )
        ],
      ),
    );
  }
}

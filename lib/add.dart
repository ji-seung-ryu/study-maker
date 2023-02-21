import 'dart:developer';

import 'package:study_maker/study.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'category.dart';

class AddPage extends StatefulWidget {
  Function callback;

  AddPage(this.callback, {super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late String title, goal, who, category;
  int CategoryIdx = 0;
  String totalPeople = '5';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          getAddAppBar(),
          Divider(color: Colors.grey),
          Expanded(
            child: getAddInput(),
          ),
        ],
      ),
    );
  }

  Widget getAddAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text('개설하기',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                letterSpacing: 0.2,
                //   color: DesignCourseAppTheme.grey,
              )),
          ElevatedButton(
            onPressed: () {
              addStudy();

              Navigator.pop(context);
            },
            child: Text('확인'),
          )
        ],
      ),
    );
  }

  Widget getAddInput() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('스터디 이름',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  letterSpacing: 0.2,
                  //   color: DesignCourseAppTheme.grey,
                )),
            SizedBox(
              height: 40, // <-- TextField height
              child: TextField(
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    filled: true, hintText: '원하시는 스터디명을 적어주세요!'),
                onChanged: (value) {
                  title = value;
                },
              ),
            ),
            Text('카테고리',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  letterSpacing: 0.2,
                )),
            getCategoryUi(),
            Text('장소',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  letterSpacing: 0.2,
                )),
            Text('시간',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  letterSpacing: 0.2,
                )),
            Text('희망 인원',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  letterSpacing: 0.2,
                )),
            TextField(
              onChanged: (value){totalPeople = value;

                log(totalPeople);
                int.parse(totalPeople) >15 ? log('yes') : log('no');
                 },

              decoration: InputDecoration(labelText: "원하시는 인원수를 입력해주세요!",
              errorText:  (int.parse(totalPeople) >15 )? '최소 2명, 최대 15명' : null ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),

            Text('모집 마감일',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  letterSpacing: 0.2,
                )),
            Text('스터디 목표',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  letterSpacing: 0.2,
                )),
            SizedBox(
              height: 120, // <-- TextField height
              child: TextField(
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    filled: true, hintText: '스터디를 통해서 이루고 싶은 목표는 무엇인가요?'),
                onChanged: (value) {
                  goal = value;
                },
              ),
            ),
            Text('희망 스터디원',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  letterSpacing: 0.2,
                )),
            SizedBox(
              height: 120, // <-- TextField height
              child: TextField(
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    filled: true,
                    hintText: '연령층, 지역, 실력 등 함께 하고 싶은 팀원의 특징을 소개해주세요!'),
                onChanged: (value) {
                  who = value;
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void addStudy() {
    Study s = Study(
      title: title,
      place: '강남역',
      time: "매주 토요일 13시-14시",
      founder: '오늘도오',
      category: '토익',
      goal: goal,
      who: who,
      totalPeople: 5,
      curPeople: 3,
      dDay: 31,
    );
    this.widget.callback(s);
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


}

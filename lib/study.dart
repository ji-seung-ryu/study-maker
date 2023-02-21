import 'package:study_maker/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Study {
  Study({
    this.title = '',
    this.place = '',
    this.time = '',
    this.founder = '',
    this.category = '',
    this.goal = '',
    this.who = '',
    this.totalPeople = 0,
    this.curPeople = 0,
    this.dDay = 0,
  });

  String title, place, time, founder, category, goal, who;
  int totalPeople, curPeople, dDay;

  static List<Study> studyList = <Study>[
    Study(
      title: '강남 토익 스터디',
      place: '강남역',
      time: "매주 토요일 13시-14시",
      founder: '오늘도오',
      category: '토익',
      goal : '안녕하세요. 토익 900점대 이상을 위한 스터디입니다. 혼자서 공부하려니까 양이 많고 막막하더라고요 ㅜㅜ 제대로 된 스터디 만들어서 빠르게 졸업하고 싶습니다!안녕하세요. 토익 900점대 이상을 위한 스터디입니다. 혼자서 공부하려니까 양이 많고 막막하더라고요 ㅜㅜ 제대로 된 스터디 만들어서 빠르게 졸업하고 싶습니다안녕하세요. 토익 900점대 이상을 위한 스터디입니다. 혼자서 공부하려니까 양이 많고 막막하더라고요 ㅜㅜ 제대로 된 스터디 만들어서 빠르게 졸업하고 싶습니다안녕하세요. 토익 900점대 이상을 위한 스터디입니다. 혼자서 공부하려니까 양이 많고 막막하더라고요 ㅜㅜ 제대로 된 스터디 만들어서 빠르게 졸업하고 싶습니다안녕하세요. 토익 900점대 이상을 위한 스터디입니다. 혼자서 공부하려니까 양이 많고 막막하더라고요 ㅜㅜ 제대로 된 스터디 만들어서 빠르게 졸업하고 싶습니다',
      who: '기본적으로 토익 700점대 이상은 나오시는 분들이 오셨으면 합니다. 근처 대학생 분들이 오셨으면 합니다. 연령층은 20대 30대 정도로 생각하고 있습니다!기본적으로 토익 700점대 이상은 나오시는 분들이 오셨으면 합니다. 근처 대학생 분들이 오셨으면 합니다. 연령층은 20대 30대 정도로 생각하고 있습니다!기본적으로 토익 700점대 이상은 나오시는 분들이 오셨으면 합니다. 근처 대학생 분들이 오셨으면 합니다. 연령층은 20대 30대 정도로 생각하고 있습니다!기본적으로 토익 700점대 이상은 나오시는 분들이 오셨으면 합니다. 근처 대학생 분들이 오셨으면 합니다. 연령층은 20대 30대 정도로 생각하고 있습니다!기본적으로 토익 700점대 이상은 나오시는 분들이 오셨으면 합니다. 근처 대학생 분들이 오셨으면 합니다. 연령층은 20대 30대 정도로 생각하고 있습니다!기본적으로 토익 700점대 이상은 나오시는 분들이 오셨으면 합니다. 근처 대학생 분들이 오셨으면 합니다. 연령층은 20대 30대 정도로 생각하고 있습니다!기본적으로 토익 700점대 이상은 나오시는 분들이 오셨으면 합니다. 근처 대학생 분들이 오셨으면 합니다. 연령층은 20대 30대 정도로 생각하고 있습니다!',

      totalPeople: 5,
      curPeople: 3,
      dDay: 31,
    ),
    Study(
      title: '논현 기타 스터디',
      place: '논현역',
      time: "매주 일요일 11시-14시",
      founder: '그렇그렇',
      category: '악기',
      totalPeople: 5,
      curPeople: 3,
      dDay: 44,
    ),
    Study(
      title: '의정부 아나운서 스터디랑 커피도 마시고 영화도',
      place: '의정부역',
      time: "매주 목,토요일 08시-09시",
      founder: 'tjj11',
      category: '아나운서',
      totalPeople: 5,
      curPeople: 3,
      dDay: 3,
    ),
    Study(
      title: '대구 토익 스터디',
      place: '동대구역',
      time: "매주 화요일 13시-14시",
      founder: 'apple!@',
      category: '토익',
      totalPeople: 9,
      curPeople: 5,
      dDay: 5,
    ),
    Study(
      title: '인천 아아 스터디',
      place: '인천역',
      time: "매주 일요일 13시-14시",
      founder: 'asds!',
      category: '커피',
      totalPeople: 4,
      curPeople: 3,
      dDay: 2,
    ),
    Study(
      title: '탑석 토익 스터디',
      place: '탑석역',
      time: "매주 토요일 13시-14시",
      founder : 'think_big',
      category: '토익',
      totalPeople: 10,
      curPeople: 4,
      dDay: 3,
    ),
  ];
}

Widget buildStudyCard(BuildContext context, Study study) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFFFFFFFF),
        border: Border.all(color: Colors.green),
      ),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white24,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          onTap: () {
            Navigator.push(context, SlideRightRoute(page: Detail(study: study,)));
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
            child: studyView(study),
            /*Text(
                Study.studyList[index].title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: 0.27,
                  color: Color(0xFF00B6F0),
                ),
              ),*/
          ),
        ),
      ),
    );

Widget studyView(Study study) {
  return Column(
    children: [
      Text(study.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0.27,
            overflow: TextOverflow.ellipsis,
          )),
      Text('모집마감 D-${study.dDay}'),
      Row(children: [
        Icon(Icons.calendar_month, size:16),
        SizedBox (width:5),
        Expanded(
          child: Text(study.time),
        )
      ]),
      Row(
        children: [
          Icon(Icons.person, size:16),
          SizedBox (width:5),
          Expanded(
            child: Text('${study.curPeople} / ${study.totalPeople}'),
          )
        ],
      )
      ,
      Row(
        children: [
          Icon(Icons.location_on_outlined, size:16),
          SizedBox (width:5),
          Expanded(
            child: Text('${study.place}'),
          )
        ],
      )
    ],
  );
}


class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}


class SlideUpRoute extends PageRouteBuilder {
  final Widget page;

  SlideUpRoute({required this.page})
      : super(
    pageBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,) =>
    page,
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}
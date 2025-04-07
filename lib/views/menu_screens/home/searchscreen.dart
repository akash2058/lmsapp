import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customsearch.dart';
import 'package:lmsapp/customwidgets/customtile.dart';
import 'package:lmsapp/models/purchase_course_model.dart';
import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/courselandingpage/courselandingpage.dart';

import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<CourseData> data;

  CustomSearchDelegate(this.data);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Filter and remove duplicates by course title
    final results = data
        .where((course) =>
            course.courseTitle != null &&
            course.courseTitle!.toLowerCase().contains(query.toLowerCase()))
        .toSet()
        .toList();

    if (results.isEmpty) {
      return const Center(
        child: Text("No results found"),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var course = results[index];
        return CustomTile(
          leading: Image.network('${course.baseUrl}/${course.courseImage}'),
          onTap: () {
            Navigator.push(
              context,
              CustomPageRoute(
                child: CourseLandingPage(id: course.courseId.toString()),
              ),
            );
          },
          title: course.courseTitle ?? '',
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Filter and remove duplicates by course title
    final suggestionList = query.isEmpty
        ? []
        : data
            .where((course) =>
                course.courseTitle != null &&
                course.courseTitle!.toLowerCase().contains(query.toLowerCase()))
            .toSet()
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        var course = suggestionList[index];
        return CustomTile(
          onTap: () {
            Navigator.push(
              context,
              CustomPageRoute(
                child: CourseLandingPage(id: course.courseId.toString()),
              ),
            );
          },
          leading: Image.network(course.baseUrl! + course.courseImage!),
          title: course.courseTitle ?? '',
        );
      },
    );
  }
}

class MySearchScreen extends StatefulWidget {
  const MySearchScreen({super.key});

  @override
  _MySearchScreenState createState() => _MySearchScreenState();
}

class _MySearchScreenState extends State<MySearchScreen> {
  List<CourseData>? courses;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var provider = Provider.of<MenuProviders>(context, listen: false);
    await provider.getMyCourse();

    // Prevent duplicates by using toSet().toList() if necessary
    setState(() {
      courses = provider.mycourse?.data?.toSet().toList() ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(width: 50.w),
          CustomSearchField(
            onTap: () {
              if (courses != null && courses!.isNotEmpty) {
                showSearch(
                  context: context,
                  delegate:
                      CustomSearchDelegate(courses!), // Ensure no duplicates
                );
              }
            },
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.clear),
                SizedBox(width: 18.w),
                SvgPicture.asset(SvgImages.bottomsheetimg),
                SizedBox(width: 18.w),
              ],
            ),
            prefix: SvgPicture.asset(SvgImages.search, height: 24.h),
            hint: 'Search any course',
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Search', style: titlestyle),
                Text('Clear all', style: paymentpricestyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

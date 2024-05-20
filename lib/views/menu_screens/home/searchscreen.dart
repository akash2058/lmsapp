import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmsapp/customwidgets/customsearch.dart';

import 'package:lmsapp/utilities/svgimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> data; // Your data source for searching

  CustomSearchDelegate(this.data);

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for search bar (e.g., clear query button)
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
    // Leading icon on the left of the search bar (e.g., back button)
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Build search results based on the query
    final results = data.where((element) => element.contains(query)).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            // Handle tapping on a search result
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Suggestions that appear as the user types
    final suggestionList = query.isEmpty
        ? []
        : data.where((element) => element.contains(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            // Handle tapping on a suggestion
            query = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}

// Usage
class MySearchScreen extends StatefulWidget {
  const MySearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MySearchScreenState createState() => _MySearchScreenState();
}

class _MySearchScreenState extends State<MySearchScreen> {
  List<String> data = [
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Pineapple'
  ]; // Your data source

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: 50.w,
            ),
            CustomSearchField(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(data),
                );
              },
              suffix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.clear),
                  SizedBox(
                    width: 18.w,
                  ),
                  SvgPicture.asset(SvgImages.bottomsheetimg),
                  SizedBox(
                    width: 18.w,
                  ),
                ],
              ),
              prefix: SvgPicture.asset(
                SvgImages.search,
                height: 24.h,
              ),
              hint: 'Search any thing',
            ),
            SizedBox(
              width: 28.w,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Search',
                    style: titlestyle,
                  ),
                  Text(
                    'Close all',
                    style: paymentpricestyle,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

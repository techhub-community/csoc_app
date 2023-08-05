import 'package:csoc/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ResourcesPage extends StatefulWidget {
  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  List<List<String>> sections = [
    [
      "https://flutter.dev/",
      "https://flutter.dev/docs",
      "https://api.flutter.dev/",
      "https://github.com/flutter/flutter",
      "https://www.youtube.com/flutterdev",
      "https://flutter.dev/docs/cookbook",
      // Add URLs for the DSA section here
    ],
    [
      "https://dart.dev/",
      "https://firebase.flutter.dev/",
      "https://resocoder.com/",
      "https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ",
      "https://www.youtube.com/watch?v=x0uinJvhNxI",
      "https://www.filledstacks.com/",
      // Add URLs for the APP DEVELOPMENT section here
    ],
    [
      "https://flutterweekly.net/",
      "https://flutter.dev/community/roadmap",
      "https://flutterawesome.com/",
      "https://flutter.institute/",
      "https://flutterbyexample.com/",
      // Add URLs for the WEB DEVELOPMENT section here
    ],
    [
      "https://codemagic.io/",
      "https://github.com/flutter/flutter/discussions",
      "https://www.reddit.com/r/FlutterDev/",
      // Add URLs for the UI/UX section here
    ],
    // You can add more sections if needed
  ];

  List<String> sectionNames = [
    "DSA",
    "APP DEVELOPMENT",
    "WEB DEVELOPMENT",
    "UI/UX",
  ];

  List<bool> isSectionExpanded = [false, false, false, false];

  Future<void> urlLauncher(String url) async {
    Uri newsUrl = Uri.parse(url);
    if (await canLaunchUrl(newsUrl)) {
      await launchUrl(newsUrl);
    } else {
      throw 'Error in opening the URL';
    }
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    Fluttertoast.showToast(
      msg: "Link copied to clipboard",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
  }

  // Updated method to build rectangular tiles with down arrow for headings
  Widget buildResourceList(List<String> resources) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: resources
          .map(
            (url) => GestureDetector(
              onTap: () => urlLauncher(url),
              onLongPress: () => _copyToClipboard(context, url),
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ),
                  ],
                
            
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    url,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Resources"),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: sections.length,
          itemBuilder: (BuildContext context, int sectionIndex) {
            final section = sections[sectionIndex];
            final isExpanded = isSectionExpanded[sectionIndex];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSectionExpanded[sectionIndex] = !isExpanded;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),//set according to media query
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sectionNames[sectionIndex], // Section names
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          size: 30,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                if (isExpanded) buildResourceList(section),
              ],
            );
          },
        ),
      ),
    );
  }
}

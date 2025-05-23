import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/features/auth/views/log_in_view.dart';
import 'package:shop/features/onBoarding/view/get_start.dart';

class Onboarding1_View extends StatefulWidget {
  @override
  _Onboarding1_ViewState createState() => _Onboarding1_ViewState();
}

class _Onboarding1_ViewState extends State<Onboarding1_View> {
  PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": AppAssets.onBoarding1,
      "title": "Choose Products",
      "subtitle":
          "Amet minim mollit non deserunt ullamco est\n sit aliqua dolor do amet sint. Velit officia\n consequat duis enim velit mollit.",
    },
    {
      "image": AppAssets.onBoarding2,
      "title": "Make Payment",
      "subtitle":
          "Amet minim mollit non deserunt ullamco est\n sit aliqua dolor do amet sint. Velit officia\n consequat duis enim velit mollit.",
    },
    {
      "image": AppAssets.onBoarding3,
      "title": "Get Your Order",
      "subtitle":
          "Amet minim mollit non deserunt ullamco est\n sit aliqua dolor do amet sint. Velit officia\n consequat duis enim velit mollit.",
    },
  ];

  void goToStartPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => Start_View()),
    );
  }

  void nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      goToStartPage();
    }
  }

  void prevPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 60,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: goToStartPage,
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppAssets.fontfamily,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Image.asset(onboardingData[index]["image"]!, height: 300),
                      SizedBox(height: 20),
                      Text(
                        onboardingData[index]["title"]!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppAssets.fontfamily,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        onboardingData[index]["subtitle"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                          fontFamily: AppAssets.fontfamily,
                        ),
                      ),
                    ],
                  ),
                ),
          ),
          // Bottom Navigation
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage == 0
                    ? SizedBox(width: 50)
                    : TextButton(
                      onPressed: prevPage,
                      child: Text(
                        "Prev",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: AppAssets.fontfamily,
                        ),
                      ),
                    ),
                Row(
                  children: List.generate(
                    onboardingData.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index
                                ? Colors.black
                                : Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: nextPage,
                  child: Text(
                    _currentPage == onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: AppAssets.fontfamily,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// don't forget to import your StartPage widget
class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Start Page", style: TextStyle(fontSize: 24))),
    );
  }
}

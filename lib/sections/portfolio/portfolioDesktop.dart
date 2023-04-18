import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/materialon.dart';
import 'package:folio/constants.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/projectCard.dart';

class PortfolioDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        children: [
          CustomSectionHeading(text: "\nPortfolio"),
          CustomSectionSubHeading(
              text: "Here are few samples of my previous work :)\n\n"),
          SizedBox(
            height: width > 1200 ? height * 0.45 : width * 0.21,
            child: CarouselSlider.builder(
              itemCount: 7,
              itemBuilder: (BuildContext context, int itemIndex, int i) =>
                  Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ProjectCard(
                  cardWidth: width < 650 ? width * 0.8 : width * 0.4,
                  projectIcon: kProjectsIcons[i],
                  projectTitle: kProjectsTitles[i],
                  projectDescription: kProjectsDescriptions[i],
                  projectLink: kProjectsLinks[i],
                ),
              ),
              options: CarouselOptions(
                  height: height * 0.4,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  enableInfiniteScroll: false),
            ),
            // ListView.separated(
            //   padding: EdgeInsets.symmetric(vertical: 20.0),
            //   scrollDirection: Axis.horizontal,
            //   separatorBuilder: (context, index) {
            //     return VerticalDivider(
            //       color: Colors.transparent,
            //       width: width * 0.015,
            //     );
            //   },
            //   itemBuilder: (context, index) {
            //     return WidgetAnimator(
            //       child: ProjectCard(
            //         cardWidth: width < 1200 ? width * 0.3 : width * 0.35,
            //         cardHeight: width < 1200 ? height * 0.32 : height * 0.1,
            //         backImage: kProjectsBanner[index],
            //         projectIcon: kProjectsIcons[index],
            //         projectTitle: kProjectsTitles[index],
            //         projectDescription: kProjectsDescriptions[index],
            //         projectLink: kProjectsLinks[index],
            //       ),
            //     );
            //   },
            //   itemCount: 7,
            // ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          OutlinedCustomBtn(
              btnText: "See More",
              onPressed: () {
                launchURL("https://github.com/SandeepKumar482");
              })
        ],
      ),
    );
  }
}

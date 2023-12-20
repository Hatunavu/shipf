import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final List<String> imageSmallFeed = [AppPath.express, AppPath.fast];
  final List<String> lableSmallFeed = [
    'Giao hàng hoả tốc',
    'Giao hàng tiết kiệm'
  ];

  final List<String> lableLargeFeed = [
    'Giao hàng khó - Để ShipF lo',
    'Ship đặc sản - ShipF sẵn sàng',
    'Đặt ShipF giao hàng siêu tiện lợi'
  ];
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bannerWidget(),
            VerticalSpace(kDefaultPaddingHeightWidget),
            smallFeed(),
            VerticalSpace(kDefaultPaddingHeightWidget),
            largeFeed(),
            VerticalSpace(kDefaultPaddingHeightWidget),
            partner(),
            VerticalSpace(kDefaultPaddingHeightWidget * 2),
          ],
        ),
      ),
    );
  }

  Widget bannerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthScreen,
              vertical: kDefaultPaddingHeightScreen),
          child: Text(
            'Gợi ý cho bạn',
            style: textHeading,
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true, aspectRatio: 2 / 1, enableInfiniteScroll: true),
          items: imgList
              .map((item) => Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthScreen / 2),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(defaultBorderRadius)),
                        child: ImageCreator.imageWithPlaceHolder(
                            url: item,
                            placeHolderAssetUri: AppPath.placeholderNoImage,
                            fit: BoxFit.cover)),
                  ))
              .toList(),
        )
      ],
    );
  }

  Widget smallFeed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthScreen,
              vertical: kDefaultPaddingHeightScreen),
          child: Text(
            'Dịch vụ ShipF',
            style: textHeading,
          ),
        ),
        SizedBox(
          height: 0.21.sh,
          child: ListView.separated(
            padding:
                EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthScreen),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: lableSmallFeed.length,
            itemBuilder: (context, index) {
              return smallFeedItem(
                  imageSmallFeed[index], lableSmallFeed[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return HorizontalSpace(kDefaultPaddingWidthWidget);
            },
          ),
        ),
      ],
    );
  }

  Widget smallFeedItem(String image, String label) {
    return Container(
      width: 0.6.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 20,
            ),
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 0.15.sh,
            width: 0.6.sw,
            child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(defaultBorderRadius)),
                child: ImageCreator.assetImage(
                    imagePath: image, fit: BoxFit.cover)),
          ),
          Container(
            height: 0.05.sh,
            alignment: Alignment.centerLeft,
            padding:
                EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthScreen),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(defaultBorderRadius))),
            child: Text(
              label,
              style: textBody.copyWith(
                  color: Colors.black, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget largeFeed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthScreen,
              vertical: kDefaultPaddingHeightScreen),
          child: Text(
            'Tin tức ShipF',
            style: textHeading,
          ),
        ),
        SizedBox(
          height: 0.29.sh,
          child: ListView.separated(
            padding:
                EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthScreen),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: lableLargeFeed.length,
            itemBuilder: (context, index) {
              return largeFeedItem(imgList[index], lableLargeFeed[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return HorizontalSpace(kDefaultPaddingWidthWidget);
            },
          ),
        ),
      ],
    );
  }

  Widget largeFeedItem(String image, String label) {
    return Container(
      width: 0.7.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 20,
            ),
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 0.2.sh,
            child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(defaultBorderRadius)),
                child: ImageCreator.imageWithPlaceHolder(
                    url: image,
                    placeHolderAssetUri: AppPath.placeholderNoImage,
                    fit: BoxFit.cover)),
          ),
          Container(
            height: 0.08.sh,
            alignment: Alignment.centerLeft,
            padding:
                EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthScreen),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(defaultBorderRadius))),
            child: Text(
              label,
              style: textBody.copyWith(
                  color: Colors.black, fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget partner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthScreen,
              vertical: kDefaultPaddingHeightScreen),
          child: Text(
            'Đối tác ShipF',
            style: textHeading,
          ),
        ),
        SizedBox(
          height: 0.1.sh,
          child: ListView.separated(
            padding:
                EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthScreen),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return partnerItem(imgList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return HorizontalSpace(kDefaultPaddingWidthWidget);
            },
          ),
        ),
      ],
    );
  }

  Widget partnerItem(String image) {
    return Container(
      width: 0.1.sh,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 20,
            ),
          ]),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          child: ImageCreator.imageWithPlaceHolder(
              url: image,
              placeHolderAssetUri: AppPath.placeholderNoImage,
              fit: BoxFit.cover)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travo_app_source/core/constants/dimension_constants.dart';
import 'package:travo_app_source/core/helpers/asset_helper.dart';
import 'package:travo_app_source/data/model/hotel_model.dart';
import 'package:travo_app_source/representation/screen/detail_hotel_screen.dart';
import 'package:travo_app_source/representation/widgets/app_bar_container.dart';
import 'package:travo_app_source/representation/widgets/item_hotel_widget.dart';

import '../../core/constants/textstyle_ext.dart';
import '../../core/helpers/image_helper.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  static const String routeName = '/all_screen';

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  final List<Map<String, String>> listImageLeft = [
    {
      'name': 'Hà Nội',
      'image': AssetHelper.hanoi,
    },
    {
      'name': 'VietNam',
      'image': AssetHelper.korea,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.hotel2,
    },
    {
      'name': 'Hà Giang',
      'image': AssetHelper.hagiang,
    },
    {
      'name': 'Dubai',
      'image': AssetHelper.dubai,
    },
  ];
  final List<Map<String, String>> listImageRight = [
    {
      'name': 'Thừa Thiên Huế',
      'image': AssetHelper.hue,
    },
    {
      'name': 'Tây Bắc',
      'image': AssetHelper.taybac,
    },
    {
      'name': 'Turkey',
      'image': AssetHelper.turkey,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.japan,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.hotel2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    Widget _buidlImageHomScreen(String name, String image) {
      return GestureDetector(
        onTap: () {
          // Navigator.of(context)
          //     .pushNamed(HotelBookingScreen.routeName, arguments: name);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: kDefaultPadding),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              ImageHelper.loadFromAsset(
                image,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                radius: BorderRadius.circular(kItemPadding),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              Positioned(
                left: kDefaultPadding,
                bottom: kDefaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyles.defaultStyle.whiteTextColor.bold,
                    ),
                    SizedBox(
                      height: kItemPadding,
                    ),
                    Container(
                      padding: EdgeInsets.all(kMinPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kMinPadding),
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.star,
                            color: Color(0xffFFC107),
                          ),
                          SizedBox(
                            width: kItemPadding,
                          ),
                          Text('4.5')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return AppBarContainer(
        implementTraling: true,
        titleString: 'All',
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: listImageLeft
                            .map(
                              (e) => _buidlImageHomScreen(
                                e['name']!,
                                e['image']!,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Expanded(
                      child: Column(
                        children: listImageRight
                            .map(
                              (e) => _buidlImageHomScreen(
                                e['name']!,
                                e['image']!,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
        // SingleChildScrollView(
        //   child: Column(
        //     children: listHotel
        //         .map(
        //           (e) => ItemHotelWidget(
        //             hotelModel: e,
        //             onTap: () {
        //               Navigator.of(context).pushNamed(DetailHotelScreen.routeName, arguments: e);
        //             },
        //           ),
        //         )
        //         .toList(),
        //   ),
        // ),
        );
  }
}

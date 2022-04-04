import 'package:duuit/services/db/db_2.dart';
import 'package:duuit/services/db/db_4.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage1 extends StatelessWidget {
  ProfilePage1({Key? key}) : super(key: key);

  final DbController2 _dbController2 = Get.find();
  final DbController4 _dbController4 = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: AppSizes.height10),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 2),
            //   child: Row(
            //     children: [
            //       Image.asset(
            //         _recapController.avatarImageConst(),
            //         height: AppSizes.height10 * 12,
            //       ),
            //       Expanded(
            //         child: Padding(
            //           padding: EdgeInsets.symmetric(
            //                   horizontal: AppSizes.width10 * 1.5)
            //               .copyWith(right: 0),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 _recapController.userName(),
            //                 style: TextStyle(
            //                     fontSize: AppSizes.height10 * 2.2,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 _recapController.userDescription(),
            //                 overflow: TextOverflow.ellipsis,
            //                 maxLines: 4,
            //                 style: TextStyle(
            //                   fontSize: AppSizes.height10 * 1.5,
            //                   color: ColorConst.greyColor,
            //                 ),
            //               ),
            //               SizedBox(height: AppSizes.height10),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: AppSizes.height10),
            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: AppSizes.height10 * 2.5),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Flexible(
            //         child: RichText(
            //           text: TextSpan(
            //             children: [
            //               TextSpan(
            //                 text: "Read ",
            //                 style: TextStyle(
            //                   fontSize: AppSizes.height10 * 2.7,
            //                   fontWeight: FontWeight.bold,
            //                   fontFamily: StringConst.nunitoSansFont,
            //                   color: ColorConst.primaryColor,
            //                 ),
            //               ),
            //               TextSpan(
            //                 text: "for ",
            //                 style: TextStyle(
            //                   fontSize: AppSizes.height10 * 2.7,
            //                   fontWeight: FontWeight.bold,
            //                   fontFamily: StringConst.nunitoSansFont,
            //                   color: ColorConst.blackColor,
            //                 ),
            //               ),
            //               TextSpan(
            //                 text: "2 weeks",
            //                 style: TextStyle(
            //                   fontSize: AppSizes.height10 * 2.7,
            //                   fontWeight: FontWeight.bold,
            //                   fontFamily: StringConst.nunitoSansFont,
            //                   color: ColorConst.primaryColor,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: AppSizes.height10 * 2.5),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Goal Description",
            //         textAlign: TextAlign.start,
            //         style: TextStyle(
            //           fontSize: AppSizes.height10 * 2,
            //           fontWeight: FontWeight.bold,
            //           fontFamily: StringConst.nunitoSansFont,
            //           color: ColorConst.blackColor,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   width: double.infinity,
            //   margin: EdgeInsets.symmetric(horizontal: AppSizes.height10 * 1.5),
            //   decoration: BoxDecoration(
            //     color: ColorConst.whiteColor,
            //     borderRadius: BorderRadius.circular(8),
            //     boxShadow: [
            //       BoxShadow(
            //         color: ColorConst.greyColor.withOpacity(0.5),
            //         spreadRadius: 1,
            //         blurRadius: 8,
            //         offset: const Offset(0, 3),
            //       ),
            //     ],
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text(
            //       _addGoalController.goalDescription(),
            //       overflow: TextOverflow.ellipsis,
            //       maxLines: 5,
            //       style: TextStyle(
            //         fontSize: AppSizes.height10 * 1.5,
            //         color: ColorConst.greyColor,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: AppSizes.height10 * 1.5),
            // Expanded(
            //   child: Obx(() {
            //     return _addBuddiesController.isEmpty()
            //         ? const Center(child: CircularProgressIndicator())
            //         : ListView.builder(
            //             physics: const BouncingScrollPhysics(),
            //             shrinkWrap: true,
            //             itemCount: _addBuddiesController.length(),
            //             itemBuilder: (context, index) {
            //               return Column(
            //                 children: [
            //                   Obx(() {
            //                     return _addBuddiesController.expanded(index)
            //                         ? CustomExpansionPanel4(
            //                             controller: _addBuddiesController,
            //                             index: index,
            //                           )
            //                         : CustomExpansionPanel3(
            //                             controller: _addBuddiesController,
            //                             index: index,
            //                           );
            //                   }),
            //                   SizedBox(height: AppSizes.height10 * 1.5),
            //                 ],
            //               );
            //             },
            //           );
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}

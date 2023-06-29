import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/custom_textfield.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:task_management/common/widgets/reusable_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(text: 'Dashboard', style: appstyle(18, AppConst.kLight, FontWeight.bold)),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: AppConst.kLight,
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.add, color: AppConst.kBkDark),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(height: 20),
              CustomTextField(
                hintText: 'Search',
                controller: searchController,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(AntDesign.search1, color: AppConst.kGreyLight),
                  ),
                ),
                suffixIcon: const Icon(FontAwesome.sliders, color: AppConst.kGreyLight),
              ),
              const HeightSpacer(height: 15),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(),
        ),
      ),
    );
  }
}

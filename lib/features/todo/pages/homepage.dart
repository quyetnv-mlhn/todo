import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_management/common/models/task_model.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/custom_textfield.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import 'package:task_management/common/widgets/width_spacer.dart';
import 'package:task_management/common/widgets/xpansion_tile.dart';
import 'package:task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:task_management/features/todo/controllers/xpansion_provider.dart';
import 'package:task_management/features/todo/pages/add.dart';
import 'package:task_management/features/todo/widgets/todo_tile.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with TickerProviderStateMixin {
  late final TabController tabController = TabController(length: 2, vsync: this);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();
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
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTask()));
                        },
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
          child: ListView(
            children: [
              const HeightSpacer(height: 25),
              Row(
                children: [
                  const Icon(FontAwesome.tasks, size: 20, color: AppConst.kLight),
                  const WidthSpacer(width: 10),
                  ReusableText(
                    text: 'Today\'s Task',
                    style: appstyle(18, AppConst.kLight, FontWeight.bold),
                  ),
                ],
              ),
              const HeightSpacer(height: 25),
              Container(
                decoration: BoxDecoration(
                  color: AppConst.kLight,
                  borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: AppConst.kGreyLight,
                    borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  ),
                  controller: tabController,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: AppConst.kBlueLight,
                  labelStyle: appstyle(24, AppConst.kBlueLight, FontWeight.w700),
                  unselectedLabelColor: AppConst.kLight,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(text: 'Pending', style: appstyle(16, AppConst.kBkDark, FontWeight.bold)),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(left: 30.w),
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child:
                              ReusableText(text: 'Completed', style: appstyle(16, AppConst.kBkDark, FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(height: 20),
              SizedBox(
                height: AppConst.kHeight * 0.3,
                width: AppConst.kWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(color: AppConst.kBkLight, height: AppConst.kHeight * 0.3, child: const TodayTask()),
                      Container(
                        color: AppConst.kBkLight,
                        height: AppConst.kHeight * 0.3,
                      ),
                    ],
                  ),
                ),
              ),
              const HeightSpacer(height: 20),
              XpansionTile(
                text1: 'Tomorrow\'s Task',
                text2: 'Tomorrow\'s tasks are shown here',
                onExpansionChanged: (expanded) {
                  ref.read(xpansionStateProvider.notifier).setStart(expanded);
                },
                trailing: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: ref.watch(xpansionStateProvider)
                      ? const Icon(AntDesign.closecircleo, color: AppConst.kGreen)
                      : const Icon(AntDesign.circledown, color: AppConst.kLight),
                ),
                children: [
                  TodoTile(
                    start: '2:00',
                    end: '2:00',
                    switcher: Switch(value: true, onChanged: (value) {}),
                  ),
                ],
              ),
              const HeightSpacer(height: 20),
              XpansionTile(
                text1: DateTime.now().add(const Duration(days: 2)).toString().substring(5, 10),
                text2: 'Day after tomorrows tasks',
                onExpansionChanged: (expanded) {
                  ref.read(xpansionState0Provider.notifier).setStart(expanded);
                },
                trailing: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: ref.watch(xpansionState0Provider)
                      ? const Icon(AntDesign.closecircleo, color: AppConst.kGreen)
                      : const Icon(AntDesign.circledown, color: AppConst.kLight),
                ),
                children: [
                  TodoTile(
                    start: '2:00',
                    end: '2:00',
                    switcher: Switch(value: true, onChanged: (value) {}),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodayTask extends ConsumerWidget {
  const TodayTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> listData = ref.read(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData.where((element) => element.isCompleted == 0 && element.date!.contains(today)).toList();
    return ListView.builder(
      itemCount: todayList.length,
      itemBuilder: (context, index) {
        final data = todayList[index];
        bool isCompleted = ref.read(todoStateProvider.notifier).getStatus(data);
        dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
        return TodoTile(
          title: data.title,
          color: color,
          description: data.desc,
          start: data.startTime,
          end: data.endTime,
          switcher: Switch(
            value: isCompleted,
            onChanged: (value) {},
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/utils/constants.dart';
import 'package:todo_app/common/widgets/appstyle.dart';
import 'package:todo_app/common/widgets/custom_text.dart';
import 'package:todo_app/common/widgets/height_spacer.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import 'package:todo_app/common/widgets/width_spacer.dart';
import 'package:todo_app/common/widgets/xpansion_tile.dart';
import 'package:todo_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:todo_app/features/todo/controllers/xpansion_provider.dart';
import 'package:todo_app/features/todo/pages/add.dart';
import 'package:todo_app/features/todo/widgets/completed_tasks.dart';
import 'package:todo_app/features/todo/widgets/dayAfterTomorrow.dart';
import 'package:todo_app/features/todo/widgets/todo_tile.dart';
import 'package:todo_app/features/todo/widgets/tomorrow_list.dart';

import '../widgets/today_task.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  final TextEditingController search = TextEditingController();

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
                    ReusableText(
                      text: "Dashboard",
                      style: appstyle(18, AppConst.kLight, FontWeight.bold),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: AppConst.kLight,
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddTask()));
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppConst.kBkLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(height: 20),
              CustomTextField(
                hintText: "search",
                controller: search,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    onTap: null,
                    child: const Icon(
                      AntDesign.search1,
                      color: AppConst.kGreyLight,
                    ),
                  ),
                ),
                suffixIcon: const Icon(
                  FontAwesome.sliders,
                  color: AppConst.kGreyLight,
                ),
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
                  const Icon(
                    FontAwesome.tasks,
                    size: 20,
                    color: AppConst.kLight,
                  ),
                  const WidthSpacer(width: 10),
                  ReusableText(
                    text: "Today's Task",
                    style: appstyle(18, AppConst.kLight, FontWeight.bold),
                  ),
                ],
              ),
              const HeightSpacer(height: 25),
              Container(
                decoration: BoxDecoration(
                  color: AppConst.kLight,
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.kRadius)),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: AppConst.kGreyLight,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppConst.kRadius),
                    ),
                  ),
                  controller: tabController,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: AppConst.kBlueLight,
                  labelStyle:
                      appstyle(24, AppConst.kBlueLight, FontWeight.w700),
                  unselectedLabelColor: AppConst.kLight,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            text: "Pending",
                            style:
                                appstyle(16, AppConst.kBkDark, FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(left: 30.w),
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                              text: "Completed",
                              style: appstyle(
                                  16, AppConst.kBkDark, FontWeight.bold)),
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
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        color: AppConst.kBkLight,
                        height: AppConst.kHeight * 0.3,
                        child: const TodayTask(),
                      ),
                      Container(
                        color: AppConst.kBkLight,
                        height: AppConst.kHeight * 0.3,
                        child: const CompletedTasks(),
                      ),
                    ],
                  ),
                ),
              ),
              const HeightSpacer(height: 20),
              const TomorrowList(),
              const HeightSpacer(height: 20),
              // const DayAfterTomorrow(),

              // XpansionTile(
              //   text: DateTime.now()
              //       .add(const Duration(days: 2))
              //       .toString()
              //       .substring(5, 10),
              //   text2: "Day After tomorrow tasks",
              //   onExpansionChanged: (bool expanded) {
              //     ref
              //         .read(expansionState0Provider.notifier)
              //         .setStart(!expanded);
              //   },
              //   trailing: Padding(
              //     padding: EdgeInsets.only(right: 12.w),
              //     child: ref.watch(expansionState0Provider)
              //         ? const Icon(AntDesign.circledown,
              //             color: AppConst.kBlueLight)
              //         : const Icon(
              //             AntDesign.closecircleo,
              //             color: AppConst.kBkLight,
              //           ),
              //   ),
              //   children: [
              //     TodoTile(
              //       start: "03:00",
              //       end: "05:00",
              //       switcher: Switch(
              //         value: true,
              //         onChanged: (value) {},
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

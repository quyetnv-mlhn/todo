import 'package:flutter/material.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/titles.dart';

class XpansionTile extends StatelessWidget {
  const XpansionTile(
      {super.key,
      required this.text1,
      required this.text2,
      required this.children,
      this.trailing,
      this.onExpansionChanged});

  final String text1;
  final String text2;
  final List<Widget> children;
  final Widget? trailing;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConst.kBkLight,
        borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: BottomTitles(
            text: text1,
            text2: text2,
          ),
          tilePadding: EdgeInsets.zero,
          trailing: trailing,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.trailing,
          children: children,
        ),
      ),
    );
  }
}

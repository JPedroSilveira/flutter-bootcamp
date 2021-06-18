import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:micard/enum/colors.dart';
import 'package:micard/enum/icon_size.dart';
import 'package:micard/enum/spacing_size.dart';

class ExpansibleCard extends StatelessWidget {
  ExpansibleCard({Key? key, required this.header, required this.body})
      : super(key: key);

  final Widget header;
  final Widget body;

  Widget _renderHeader(bool expanded) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SpacingSize.small.value,
        horizontal: SpacingSize.medium.value,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          header,
          Container(
            alignment: Alignment.bottomRight,
            child: expanded ? _renderCloseIcon() : _renderOpenIcon(),
          )
        ],
      ),
    );
  }

  Widget _renderBody() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        vertical: SpacingSize.small.value,
        horizontal: SpacingSize.medium.value,
      ),
      child: body,
    );
  }

  Widget _renderActionIcon(bool expanded) {
    return Icon(
      expanded ? Icons.expand_more : Icons.expand_less,
      color: AppColors.primary_text.value,
      size: IconSize.medium.value,
    );
  }

  Widget _renderOpenIcon() {
    return _renderActionIcon(true);
  }

  Widget _renderCloseIcon() {
    return ExpandableButton(
      child: _renderActionIcon(false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: SpacingSize.small.value,
            horizontal: SpacingSize.medium.value,
          ),
          child: Card(
            color: AppColors.light_primary.value,
            child: Column(
              children: [
                Expandable(
                  collapsed: ExpandableButton(
                    child: _renderHeader(false),
                  ),
                  expanded: Column(children: [
                    _renderHeader(true),
                    _renderBody(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

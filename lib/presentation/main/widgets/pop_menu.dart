import 'package:flutter/material.dart';
import 'package:muadz_mobilefeordo/core/values/colors.dart';

class PopMenu extends StatelessWidget {
  const PopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    FilterState? state = FilterState.daily;

    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
      ),
      child: PopupMenuButton(
        icon: const Icon(Icons.more_horiz, color: Colors.white),
        initialValue: 1,
        position: PopupMenuPosition.under,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            height: 40,
            value: 1,
            child: Text(
              'Daily',
              style: kPoppins.copyWith(
                  color: state == FilterState.daily ? primaryColor : textColor),
            ),
          ),
          PopupMenuItem(
            height: 40,
            value: 2,
            child: Text(
              'Weekly',
              style: kPoppins.copyWith(
                  color:
                      state == FilterState.weekly ? primaryColor : textColor),
            ),
          ),
          PopupMenuItem(
            height: 40,
            value: 3,
            child: Text(
              'Monthly',
              style: kPoppins.copyWith(
                  color:
                      state == FilterState.monthly ? primaryColor : textColor),
            ),
          )
        ],
        onSelected: (value) {
          switch (value) {
            case 1:
              state = FilterState.daily;
              break;
            case 2:
              state = FilterState.weekly;
              break;
            case 3:
              state = FilterState.monthly;
              break;
            default:
          }
        },
      ),
    );
  }
}

enum FilterState { daily, weekly, monthly }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muadz_mobilefeordo/presentation/main/widgets/perform_session.dart';
import 'package:muadz_mobilefeordo/presentation/main/widgets/recent_session.dart';

class HomeBottomSheet extends StatefulWidget {
  const HomeBottomSheet({super.key});

  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 0.8,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.only(top: 45),
          height: Get.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PerformSession(),
                  SizedBox(height: 25),
                  RecentSession(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

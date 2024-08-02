import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/account/data/account_view_data.dart';
import 'package:proj/local/modules/account/view/widgets/account_card.dart';
import 'package:proj/local/modules/account/view/widgets/account_image_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          child: Stack(
            children: [
              const AccountImageView(),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin:
                      EdgeInsets.only(top: AppSize.screenHight(context) / 4.6),
                  width: AppSize.screenWidth(context) / 1.1,
                  child: Column(
                    children: [
                      AccountCard(
                        dataList: AccountViewData.upperList,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.screenWidth(context) * 0.05,
          ),
          child: SizedBox(
            child: AccountCard(
              dataList: AccountViewData.lowerList,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

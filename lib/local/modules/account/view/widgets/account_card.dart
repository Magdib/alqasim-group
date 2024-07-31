import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/account/model/account_pages_model.dart';
import 'package:proj/local/view/widgets/dividers/custom_horizontal_divider.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.dataList,
  });
  final List<AccountPagesModel> dataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [BoxShadow(color: AppColors.lBlack, blurRadius: 5)]),
      child: Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Column(
              children: [
                SizedBox(
                  height: 4,
                ),
                CustomHorizontalDivider(),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
            itemCount: dataList.length,
            itemBuilder: (context, index) => Row(
              children: [
                Icon(
                  dataList[index].icon,
                  color: AppColors.primaryColor,
                  size: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(dataList[index].title,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          const CustomHorizontalDivider()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/modules/carspage/controller/cars_page_controller.dart';

class BrandGridViewFilter extends StatelessWidget {
  const BrandGridViewFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarsPageController>(
      builder: (controller) => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 2.h),
        itemCount: controller.brands.length,
        itemBuilder: (context, index) => Row(
          children: [
            Checkbox(
                value: controller.brands[index].value,
                visualDensity: const VisualDensity(horizontal: -4),
                onChanged: (value) =>
                    controller.brandCheckValue(index, value!)),
            SizedBox(
              width: 60.w,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  controller.brands[index].title,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

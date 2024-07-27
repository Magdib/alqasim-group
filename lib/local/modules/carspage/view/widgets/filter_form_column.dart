import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/modules/carspage/controller/cars_page_controller.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class FilterFormColumn extends StatelessWidget {
  const FilterFormColumn({
    super.key,
    required this.hint,
    required this.title,
  });
  final String title;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarsPageController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.5),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            hint: hint,
            textEditingController:
                title == "موقع" ? controller.carLocation : controller.carTitle,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

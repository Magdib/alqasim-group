// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../../core/constant/app_size.dart';
// import '../../../core/constant/colors.dart';
// import '../../shared/widgets/loading/loading_points.dart';

// class CustomExitButton extends StatelessWidget {
//   const CustomExitButton({
//     super.key,
//     this.color,
//     this.radius,
//     this.onTap,
//     this.isLoading = false, this.iconData, this.iconColor,
//   });
//   final Color? color;
//   final double? radius;
//   final void Function()? onTap;
//   final bool isLoading;
//   final IconData? iconData;
//    final Color? iconColor;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap ??
//           () {
//             Get.back();
//           },
//       child: CircleAvatar(
//         radius: radius ?? 20,
//         backgroundColor: color ?? AppColors.red.withOpacity(0.7),
//         child: isLoading
//             ? const LoadingPoint()
//             :  Center(
//                 child: Icon(
//                  iconData?? Icons.close,
//                  size: AppSize.screenWidth >= AppSize.tabletBreakPoint?20.sp:null,
//                   color:iconColor?? AppColors.white,
//                 ),
//               ),
//       ),
//     );
//   }
// }

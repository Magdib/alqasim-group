import 'package:flutter/material.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/account/model/account_pages_model.dart';

class AccountViewData {
  static final List<AccountPagesModel> upperList = [
    AccountPagesModel(
        title: "إعدادات الحساب",
        icon: Icons.account_circle_outlined,
        route: AppRoutes.mainRoute),
    AccountPagesModel(
        title: "مدوّنة",
        icon: Icons.people_alt_outlined,
        route: AppRoutes.mainRoute),
  ];
  static final List<AccountPagesModel> lowerList = [
    AccountPagesModel(
        title: "اتصل بنا",
        icon: Icons.support_agent_outlined,
        route: AppRoutes.mainRoute),
    AccountPagesModel(
        title: "الأحكام والشروط",
        icon: Icons.policy,
        route: AppRoutes.mainRoute),
    AccountPagesModel(
        title: "سياسة الخصوصية",
        icon: Icons.lock_outline,
        route: AppRoutes.mainRoute),
    AccountPagesModel(
        title: "التعليمات",
        icon: Icons.perm_device_info_rounded,
        route: AppRoutes.mainRoute),
    AccountPagesModel(
        title: "تسجيل الخروج", icon: Icons.logout, route: AppRoutes.mainRoute),
  ];
}

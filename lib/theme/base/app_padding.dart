import 'package:flutter/material.dart';
import 'app_spacing.dart';

class AppPadding {
  AppPadding._();

  static const EdgeInsets xs   = EdgeInsets.all(AppSpacing.xs);
  static const EdgeInsets sm   = EdgeInsets.all(AppSpacing.sm);
  static const EdgeInsets md   = EdgeInsets.all(AppSpacing.md);
  static const EdgeInsets lg   = EdgeInsets.all(AppSpacing.lg);
  static const EdgeInsets xl   = EdgeInsets.all(AppSpacing.xl);
  static const EdgeInsets xxl  = EdgeInsets.all(AppSpacing.xxl);

  static const EdgeInsets horizontalxs  = EdgeInsets.symmetric(horizontal: AppSpacing.xs);
  static const EdgeInsets horizontalsm  = EdgeInsets.symmetric(horizontal: AppSpacing.sm);
  static const EdgeInsets horizontalmd  = EdgeInsets.symmetric(horizontal: AppSpacing.md);
  static const EdgeInsets horizontallg  = EdgeInsets.symmetric(horizontal: AppSpacing.lg);
  static const EdgeInsets horizontalxl  = EdgeInsets.symmetric(horizontal: AppSpacing.xl);
  static const EdgeInsets horizontalxxl = EdgeInsets.symmetric(horizontal: AppSpacing.xxl);

  static const EdgeInsets verticalxs   =  EdgeInsets.symmetric(vertical: AppSpacing.xs);
  static const EdgeInsets verticalsm   =  EdgeInsets.symmetric(vertical: AppSpacing.sm);
  static const EdgeInsets verticalMd   =  EdgeInsets.symmetric(vertical: AppSpacing.md);
  static const EdgeInsets verticallg   =  EdgeInsets.symmetric(vertical: AppSpacing.lg);
  static const EdgeInsets verticalxl   =  EdgeInsets.symmetric(vertical: AppSpacing.xl);
  static const EdgeInsets verticalxxl  =  EdgeInsets.symmetric(vertical: AppSpacing.xxl);

  //feature based paddings

  static const EdgeInsets statusBannerPadding     = EdgeInsets.all(12);
  static const EdgeInsets bottomSheetPadding      = EdgeInsets.all(8);
  static const EdgeInsets textFieldContentPadding = EdgeInsets.all(8);
  static const EdgeInsets screenPadding           = EdgeInsets.all(8);

}
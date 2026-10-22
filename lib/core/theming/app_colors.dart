import 'package:flutter/material.dart';
import 'package:newf/core/shared/methods/hex_color.dart';

abstract class AppColors {

   static const Color green = Colors.green;
   static const Color blue = Colors.blue;
   static const Color gold = Color(0xFFE2BE7F);
   static const Color red = Colors.red;
   static const Color primaryGoldStart = Color(0xFFC0A27B);
   static const Color contractorGreen = Color(0xFF48BB78);

   static const Color contractorGreyText = Color(0xFF718096);

   // Light Mode Colors
   static const Color primaryLightColor = Color(0xFF137A7A);
   static const Color secondryLightColor = Color(0xFFFF6B6B);
   static const Color lightBackground = Color(0xFFFFFFFF);
   static const Color lightSurface = Color(0xFFF8F9FA);
   static const Color lightTextPrimary = Color(0xFF2D3748);
   static const Color lightTextSecondary = Color(0xFF718096);
   static const Color lightBorder = Color(0xFFE2E8F0);


   // Dark Mode Colors
   static   Color primaryDarkColor = HexColor("#02a696");
   static const Color secondryDarkColor = Color(0xFFFF6B6B);

   static const Color darkBackground = Color(0xFF121212);
   static const Color darkSurface = Color(0xFF1E2729); // Slightly teal-tinted dark grey
   static const Color darkTextPrimary = Color(0xFFF7FAFC);
   static const Color darkTextSecondary = Color(0xFFA0AEC0);
   static const Color darkBorder = Color(0xFF2D3748);

   // Attendance Design Colors
   static const Color headerBackground = Color(0xFF1B3B8B);
   static const Color headerBadgeBg = Color(0xFF2B4D9D);
   static const Color headerTimeDateBg = Color(0xFF244493);
   static const Color notificationRed = Color(0xFFEF4444);
   static const Color onlineGreen = Color(0xFF10B981);
   static const Color roleSwitchBg = Color(0xFFF1F5F9);
   static const Color roleSwitchSelectedBg = Color(0xFFFFFFFF);
   static const Color roleSwitchSelectedText = Color(0xFF1B3B8B);
   static const Color roleSwitchUnselectedText = Color(0xFF64748B);
   static const Color cardBackground = Color(0xFFFFFFFF);
   static const Color cardBorder = Color(0xFFEEF2F6);
   static const Color commitmentBadgeBg = Color(0xFFE0E7FF);
   static const Color commitmentBadgeText = Color(0xFF4338CA);
   static const Color statusPresentBg = Color(0xFFE8F7F0);
   static const Color statusPresentText = Color(0xFF059669);
   static const Color statusLateBg = Color(0xFFFEF3C7);
   static const Color statusLateText = Color(0xFFD97706);
   static const Color statusAbsentBg = Color(0xFFFEE2E2);
   static const Color statusAbsentText = Color(0xFFDC2626);
   static const Color statusLeaveBg = Color(0xFFE0F2FE);
   static const Color statusLeaveText = Color(0xFF0284C7);
   static const Color alertWarningBg = Color(0xFFFFFBEB);
   static const Color alertWarningText = Color(0xFFB45309);
   static const Color alertWarningBorder = Color(0xFFFDE68A);
   static const Color primaryActionRed = Color(0xFFDC2626);
   static const Color gpsRadarBg = Color(0xFF0B192C);
   static const Color gpsRadarGrid = Color(0xFF1E293B);
   static const Color gpsRadarCircle = Color(0xFF0D9488);
   static const Color gpsRadarIndicator = Color(0xFF14B8A6);
   static const Color gpsTagBg = Color(0xFFE6F4EA);
   static const Color gpsTagText = Color(0xFF137333);
   static const Color policyCardBg = Color(0xFFEEF2FF);
   static const Color policyCardBorder = Color(0xFFE0E7FF);
   static const Color policyCardText = Color(0xFF1B3B8B);
   static const Color bottomNavActive = Color(0xFF1B3B8B);
   static const Color bottomNavInactive = Color(0xFF94A3B8);
   static const Color bottomNavBg = Color(0xFFFFFFFF);
   static const Color metricContainerBg = Color(0xFFF8FAFC);
   static const Color metricBorder = Color(0xFFE2E8F0);
   static const Color tagReviewBg = Color(0xFFFEF3C7);
   static const Color tagReviewText = Color(0xFFB45309);
   static const Color tagApprovedBg = Color(0xFFD1FAE5);
   static const Color tagApprovedText = Color(0xFF065F46);
}

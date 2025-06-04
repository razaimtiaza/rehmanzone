// lib/all_imports.dart

// Flutter and Provider imports
export 'package:flutter/material.dart';
export 'package:flutter/widgets.dart';
export 'package:provider/provider.dart';

// Config and Utilities
export 'package:rehman_zone/config/database/database_helper.dart';
export 'package:rehman_zone/config/utilits/app_image.dart';
export 'package:rehman_zone/config/utilits/app_colors.dart';
export 'package:rehman_zone/utils/coustom_text.dart';
export 'package:rehman_zone/utils/padding_extension.dart';
export 'package:rehman_zone/utils/media_query.dart';
export 'package:rehman_zone/config/utilits/app_constant.dart';

export 'package:rehman_zone/utils/custom_button.dart';
export 'package:rehman_zone/features/dashboard_content/widget/content_container.dart';

// Routes
export 'package:rehman_zone/routes/app_route.dart';

// Providers
export 'package:rehman_zone/features/dashboard/provider/dashboardprovider.dart';
export 'package:rehman_zone/features/dashboard_content/hadith_content/hadithscreen/provider/hadith_provider.dart';
export 'package:rehman_zone/features/dashboard_content/quran_content/parah/provider/prahprovider.dart';
export 'package:rehman_zone/features/dashboard_content/quran_content/provider/quranprovider.dart';
export 'package:rehman_zone/features/dashboard_content/quran_content/surah/provider/surah_provider.dart';
export 'package:rehman_zone/features/splashscreen/provider/splash_provider.dart';
export 'package:rehman_zone/features/dashboard_content/provider/content_provider.dart';
export 'package:rehman_zone/config/globalmethod/text_to_speech.dart';

// Views (Screens)
export 'package:rehman_zone/features/dashboard/view/dashboardscreen.dart';
export 'package:rehman_zone/features/dashboard_content/hadith_content/hadithscreen/view/hadithdetailScreen.dart';
export 'package:rehman_zone/features/dashboard_content/quran_content/surah/view/surah_detail_screen.dart';
export 'package:rehman_zone/features/onboadingscreen/view/onboading_scren.dart';
export 'package:rehman_zone/features/splashscreen/view/splash_screen.dart';
export 'package:rehman_zone/features/dashboard_content/hadith_content/bookmark/view/bookmark_screem.dart';
export 'package:rehman_zone/features/dashboard_content/quran_content/parah/view/prahscreen.dart';
export 'package:rehman_zone/features/dashboard_content/quran_content/surah/view/surahscreen.dart';
export 'package:rehman_zone/features/dashboard/widget/bottom_navigationbar.dart';
export 'package:rehman_zone/features/dashboard/widget/customdrawer.dart';
export 'package:rehman_zone/features/dashboard_content/hadith_content/view/hadith_content_screen.dart';
export 'package:rehman_zone/features/dashboard_content/quran_content/view/quranscreen.dart';
export 'package:rehman_zone/utils/appbar/coustom_appbar.dart';
// Models
export 'package:rehman_zone/activities/hadith_list/model/hadith_model.dart';
export 'package:rehman_zone/activities/surah_list/model/surah_model.dart';
export 'package:rehman_zone/activities/parah_list/model/parah_model.dart';
export 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
export 'package:rehman_zone/activities/quran_list/model/quran_model.dart';
export 'package:rehman_zone/features/dashboard_content/quran_content/parah/view/prahdetailscreen.dart';
// Repositories
export 'package:rehman_zone/activities/hadith_list/repository/hadith_repository.dart';
export 'package:rehman_zone/activities/parah_list/repository/parah_repository.dart';
export 'package:rehman_zone/activities/surah_list/repository/surah_repository.dart';
export 'package:rehman_zone/activities/surah_list/source/logic/surah_logic.dart';

// Local Storage and Database
export 'package:rehman_zone/activities/hadith_list/source/logic/hadith_local_storage.dart';
export 'package:rehman_zone/activities/parah_list/source/logic/parah_loacl_stoarge.dart';
export 'package:sqflite/sqflite.dart';

//packages imports
export 'package:gone_board/gone_board.dart';
export 'package:starsview/starsview.dart';

//database
export 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
export 'package:path/path.dart';
export 'package:path_provider/path_provider.dart';

export 'dart:io';
export 'dart:convert';

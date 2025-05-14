import 'package:eschool_management/core/constants/app_assets.dart';
import 'package:eschool_management/core/constants/app_colors.dart';
import 'package:eschool_management/core/utils/helper_functions.dart';
import 'package:eschool_management/core/utils/local/local_service.dart';
import 'package:eschool_management/dependencies_injection.dart';
import 'package:eschool_management/features/presentation/manager/events/get_events/get_events_cubit.dart';
import 'package:eschool_management/features/presentation/manager/exams/get_today_next_week_exam/get_today_next_week_exam_cubit.dart';
import 'package:eschool_management/features/presentation/manager/user/personal_user_info/personal_user_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/subject_map.dart';
import '../../manager/timetable/today_classes/get_today_classes_cubit.dart';
import '../global/widgets_imports.dart';

part 'discover_item.dart';
part 'event_item.dart';
part 'exam_item.dart';
part 'header_home.dart';
part 'today_classes_item.dart';

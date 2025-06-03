import 'package:cached_network_image/cached_network_image.dart';
import 'package:eschool_management/core/constants/app_assets.dart';
import 'package:eschool_management/core/utils/local/local_service.dart';
import 'package:eschool_management/core/utils/subject_map.dart';
import 'package:eschool_management/features/domain/entities/timetable/timetable_by_day_entity.dart';
import 'package:eschool_management/features/presentation/manager/exams/get_exams_by_day/get_exams_by_day_cubit.dart';
import 'package:eschool_management/features/presentation/manager/homeworks/my_homeworks_by_day/my_homeworks_by_day_cubit.dart';
import 'package:eschool_management/features/presentation/widgets/global/widgets_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/api/endpoints_constants.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/helper_functions.dart';

part 'my_exam_by_day_item.dart';
part 'my_homework_by_day_item.dart';
part 'other_functionnalities_item.dart';
part 'selected_timetable_by_day.dart';

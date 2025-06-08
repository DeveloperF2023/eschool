import 'package:cached_network_image/cached_network_image.dart';
import 'package:eschool_management/core/api/endpoints_constants.dart';
import 'package:eschool_management/core/constants/app_colors.dart';
import 'package:eschool_management/core/routes/app_routes.dart';
import 'package:eschool_management/core/utils/helper_functions.dart';
import 'package:eschool_management/dependencies_injection.dart';
import 'package:eschool_management/features/domain/entities/events/event_entity.dart';
import 'package:eschool_management/features/presentation/manager/events/get_recent_event/get_recent_event_cubit.dart';
import 'package:eschool_management/features/presentation/manager/events/get_today_events/get_today_events_cubit.dart';
import 'package:eschool_management/features/presentation/widgets/global/widgets_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

import '../../../../core/utils/extension/format_time.dart';
import '../../../../core/utils/local/local_service.dart';
import '../../manager/events/get_events/get_events_cubit.dart';

part 'event_item.dart';
part 'header_detail_event.dart';
part 'recent_event.dart';
part 'today_event.dart';
part 'upcoming_event.dart';

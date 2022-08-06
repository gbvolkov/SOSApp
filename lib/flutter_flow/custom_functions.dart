import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int getMoodColor(
  int moodIdx,
  List<int> moodColors,
) {
  moodIdx = (moodIdx < 0)
      ? 0
      : (moodIdx >= moodColors.length)
          ? moodColors.length - 1
          : moodIdx;
  return moodColors[moodIdx];
}

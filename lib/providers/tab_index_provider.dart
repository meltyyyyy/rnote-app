import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/tab_index.dart';

// ignore_for_file: type=lint
final tabIndexProvider = StateProvider<int>((_) => TabIndex.shopping);

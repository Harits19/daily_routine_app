import 'dart:convert';
import 'dart:io';

import 'package:daily_routine_app/src/models/daily_routine_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class PathProviderService {
    Future<void> export(DailyRoutineModel dailyRoutineModel) async {
    final tempPath = await getTemporaryDirectory();
    final jsonFile = File('${tempPath.path}/daily_routine.json');
    if (!(await jsonFile.exists())) {
      await jsonFile.create(recursive: true);
    }
    final dailyRoutineString = jsonEncode(dailyRoutineModel.toJson());
    await jsonFile.writeAsString(dailyRoutineString);
    Share.shareXFiles([XFile(jsonFile.path)]);
  }

    Future<DailyRoutineModel?> import() async {
    final pickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    if (pickerResult == null) return null;
    final pathFile = pickerResult.files.single.path;
    if (pathFile == null) return null;
    final jsonFile = File(pathFile);
    final dailyRoutineString = await jsonFile.readAsString();
    final dailyRoutineDecode = jsonDecode(dailyRoutineString);
    final dailyRoutine = DailyRoutineModel.fromJson(dailyRoutineDecode);
    return dailyRoutine;
  }
}

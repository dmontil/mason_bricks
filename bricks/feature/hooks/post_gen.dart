import 'package:mason/mason.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

void run(HookContext context) async {
  await generateLayersFeature(context);
  await runFlutterPubGet(context);
}

Future<void> generateLayersFeature(HookContext context) async {
  var layers = ['domain', 'data', 'presentation'];
  for (var brickName in layers) {
    await generateFromBrick(brickName, context);
  }
}

Future<void> runFlutterPubGet(HookContext context) async {
  var result = await Process.run('flutter', ['pub', 'get']);
  if (result.exitCode != 0) {
    context.logger.err('Failed to run flutter pub get: ${result.stderr}');
  } else {
    context.logger.detail('Successfully ran flutter pub get');
  }
}

Future<void> generateFromBrick(String brickName, HookContext context) async {
  var brickPath = getBrickPath(brickName);
  if (!doesBrickExist(brickPath)) {
    context.logger.err('File not found: $brickPath');
    return;
  }

  var generator = await MasonGenerator.fromBrick(Brick.path(brickPath));
  var outputDirectory = getOutputDirectory(context.vars['name'], brickName);
  var files = await generator.generate(
    DirectoryGeneratorTarget(outputDirectory),
    vars: <String, dynamic>{'name': context.vars['name']},
  );

  logGeneratedFiles(context, files);
}

String getBrickPath(String brickName) {
  var currentPath = path.normalize(path.join(Directory.current.path, '..', '..'));
  return path.join(currentPath, 'bricks', brickName);
}

bool doesBrickExist(String brickPath) {
  return File(path.join(brickPath, 'brick.yaml')).existsSync();
}

Directory getOutputDirectory(String featureName, String brickName) {
  return Directory(path.join(Directory.current.path, featureName, brickName));
}

void logGeneratedFiles(HookContext context, List<GeneratedFile> files) {
  for (var file in files) {
    context.logger.detail('Generated: ${file.path}');
  }
}

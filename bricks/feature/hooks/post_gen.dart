import 'dart:convert';

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
    await generateFromBrick2(brickName, context);
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


Future<void> generateFromBrick2(String brickName, HookContext context) async {
  var outputDirectory = getOutputDirectory(context.vars['name'], brickName, context);
  outputDirectory.createSync(recursive: true); // This will create the directory
  context.logger.detail(outputDirectory.path);


  var result = await Process.start(
    'mason', ['make', brickName, '-o', outputDirectory.path, '--name', context.vars['name']]
  );
  result.stdout.transform(utf8.decoder).listen((data) => print(data));
  result.stderr.transform(utf8.decoder).listen((data) => print(data));

  var exitCode = await result.exitCode;

  if (exitCode != 0) {
    context.logger.err('Failed to generate from brick');
  } else {
    context.logger.detail('Successfully generated from brick');
  }
}

String getBrickPath(String brickName) {
  var currentPath =
      path.normalize(path.join(Directory.current.path, '..', '..'));
  return path.join(currentPath, 'bricks', brickName);
}

bool doesBrickExist(String brickPath) {
  return File(path.join(brickPath, 'brick.yaml')).existsSync();
}


Directory getOutputDirectory(String featureName, String brickName, HookContext context) {
  if (context.vars['split']) {
    return Directory(path.join(Directory.current.path, 'lib', brickName, featureName));
  } else {
    return Directory(path.join(Directory.current.path, featureName, brickName));
  }
}

void logGeneratedFiles(HookContext context, List<GeneratedFile> files) {
  for (var file in files) {
    context.logger.detail('Generated: ${file.path}');
  }
}

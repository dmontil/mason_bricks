import 'dart:convert';
import 'dart:io';
import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

void run(HookContext context) async {
  await generateLayersFeature(context);
  await runFlutterPubGet(context);
}

Future<void> generateLayersFeature(HookContext context) async {
  const layers = ['domain', 'data', 'presentation'];
  for (var layer in layers) {
    await generateFromBrick(layer, context);
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
  var outputDirectory =
      getOutputDirectory2(context.vars['name'], brickName, context);
  outputDirectory.createSync(recursive: true);
  context.logger.detail(outputDirectory.path);

  var result = await Process.start('mason', [
    'make',
    brickName,
    '-o',
    outputDirectory.path,
    '--name',
    context.vars['name']
  ]);

  result.stdout.transform(utf8.decoder).listen(print);
  result.stderr.transform(utf8.decoder).listen(print);

  if (await result.exitCode != 0) {
    context.logger.err('Failed to generate from brick');
  } else {
    context.logger.detail('Successfully generated from brick');
  }
}

Directory getOutputDirectory(
    String featureName, String brickName, HookContext context) {
  if (context.vars['split']) {
    return Directory(
        path.join(Directory.current.path, 'lib', brickName, featureName));
  } else {
    return Directory(path.join(Directory.current.path, featureName, brickName));
  }
}
Directory getOutputDirectory2(
    String featureName, String brickName, HookContext context) {
  var basePath = Directory.current.path;
  var split = context.vars['split'] as bool ;
  var paths = split ? [basePath, 'lib', brickName, featureName] : [basePath, featureName, brickName];
  return Directory(path.joinAll(paths));
}
void logGeneratedFiles(HookContext context, List<GeneratedFile> files) {
  files.forEach((file) => context.logger.detail('Generated: ${file.path}'));
}

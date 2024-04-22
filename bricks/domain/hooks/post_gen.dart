import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final runPostGen = context.vars['run_post_gen'] as bool? ?? false;

  if (runPostGen) {
    // context.logger.info('Running flutter pub get...');
    // var process = await Process.start('flutter', ['pub', 'get']);
    // await stdout.addStream(process.stdout);
    // await stderr.addStream(process.stderr);

    context.logger.info('Running flutter pub run build_runner build...');
    var process = await Process.start('flutter', ['pub', 'run', 'build_runner', 'build']);
    await stdout.addStream(process.stdout);
    await stderr.addStream(process.stderr);
  } else {
    context.logger.info('Skipping post-generation script...');
  }
}

#! /usr/bin/env -S my-dart -s

import 'dart:core';
import 'package:output/output.dart';
import 'package:global_logger/global_logger.dart';
import 'package:std/std.dart' as std_std;
import 'package:sys/sys.dart' as sys_sys;

main(List<String> args) {
  echo('helloハロー©');
  $logger.i('helloハロー©');
  echoJson(sys_sys.readFileString('~/.bashrc'));
  echo(sys_sys.fileExists('~/.bashrc'));
  echo(sys_sys.fileExists('~/.bashrcX'));
}

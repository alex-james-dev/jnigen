// Copyright (c) 2022, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:jnigen/jnigen.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' hide equals;

import 'generate.dart';
import '../test_util/test_util.dart';

void main() async {
  await checkLocallyBuiltDependencies();

  test("Generate and compare bindings for simple_package", () async {
    await generateAndCompareBindings(
      getConfig(),
      join(testRoot, "lib", "simple_package.dart"),
      join(testRoot, "src"),
    );
  }); // test if generated file == expected file
  test("Generate and analyze bindings for simple_package - pure dart",
      () async {
    await generateAndAnalyzeBindings(
      getConfig(BindingsType.dartOnly),
    );
  }); // test if generated file == expected file
}

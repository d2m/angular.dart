library debug;

import 'package:js/js.dart' as js;
import 'dart:html';

String depth = '';

ENTER(name) {
  dump('${depth}ENTER: $name');
  depth = depth +  '  ';
}

LEAVE(name) {
  depth = depth.substring(0, depth.length -2);
  dump('${depth}LEAVE: $name');
}

MARK(name) {
  dump('$depth$name');
}


dump([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]) {
  var log = [];
  if (?p1) log.add(STRINGIFY(p1));
  if (?p2) log.add(STRINGIFY(p2));
  if (?p3) log.add(STRINGIFY(p3));
  if (?p4) log.add(STRINGIFY(p4));
  if (?p5) log.add(STRINGIFY(p5));
  if (?p6) log.add(STRINGIFY(p6));
  if (?p7) log.add(STRINGIFY(p7));
  if (?p8) log.add(STRINGIFY(p8));
  if (?p9) log.add(STRINGIFY(p9));
  if (?p10) log.add(STRINGIFY(p10));
  js.scoped(() {
    js.context.console.log(log.join(', '));
  });
}

STRINGIFY(obj) {
  if (obj is List) {
    var out = [];
    obj.forEach((i) => out.add(STRINGIFY(i)));
    return '[${out.join(", ")}]';
  } else if (obj is Comment) {
    return '<!--${obj.text}-->';
  } else if (obj is Element) {
    return obj.outerHtml;
  } else if (obj is String) {
    return '"$obj"';
  } else {
    return obj.toString();
  }
}

main() {}

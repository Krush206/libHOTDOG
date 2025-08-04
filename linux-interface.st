#!/usr/local/bin/gst -f

| file |

file := File name: './linux'.
file do: [ :i |
  i name ~ '\.m$' ifTrue: [ | data print |
    print := false.
    data := i contents.
    data linesDo: [ :i |
      i ~ '^@interface' ifTrue: [
        print := true.
      ].
      print ifTrue: [
        i displayNl.
      ].
      i ~ '^@end' ifTrue: [
        print := false.
      ].
    ].
  ].
].

#!/usr/local/bin/gst -f

| file |

file := File name: './objects'.
file do: [ :i |
  i name ~ '\.m$' ifTrue: [ | data print |
    print := false.
    data := i contents.
    data linesDo: [ :i |
      i ~ '^@interface' ifTrue: [
        i displayNl.
        print := true.
      ] ifFalse: [
        print ifTrue: [
          i displayNl.
        ].
        i ~ '^@end' ifTrue: [
          print := false.
        ].
      ].
    ].
  ].
].

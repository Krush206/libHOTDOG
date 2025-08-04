#!/usr/local/bin/gst -f

| file |

file := File name: './objects'.
file do: [ :i |
  i name ~ '\.m$' ifTrue: [ | data skip newData newFile |
    skip := false.
    newData := #().
    data := i contents.
    data linesDo: [ :i |
      i ~ '^@interface' ifTrue: [
        skip := true.
      ] ifFalse: [
        skip ifFalse: [
          newData := newData, (Array with: i).
        ].
        i ~ '^@end' ifTrue: [
          skip := false.
        ].
      ].
    ].
    i remove.
    i touch.
    newFile := FileStream open: (i name).
    newData do: [ :i |
      newFile nextPutAll: (i, (Character nl asString)).
    ].
    newFile close.
  ].
].

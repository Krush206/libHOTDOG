#!/usr/local/bin/gst -f

| file |

file := File name: './linux'.
file do: [ :i |
  i name ~ '\.m$' ifTrue: [ | data skip newData newFile |
    skip := false.
    newData := #().
    data := i contents.
    data linesDo: [ :i |
      i ~ '^@interface' ifTrue: [
        skip := true.
      ].
      skip ifFalse: [
        newData := newData, (Array with: i).
      ].
      i ~ '^@end' ifTrue: [
        skip := false.
      ].
    ].
    newFile := FileStream open: (i name).
    newFile := newFile truncate.
    newData do: [ :i |
      newFile nextPutAll: (i, (Character nl asString)).
    ].
    newFile close.
  ].
].

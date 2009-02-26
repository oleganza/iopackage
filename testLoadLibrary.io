#!/usr/bin/env io
Verify := doRelativeFile("verify.io")

Verify clone do(
  test := method(
    verify(1 == 1)
  )
) run shortFormat println

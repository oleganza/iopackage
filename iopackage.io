#!/usr/bin/env io

Package := Object clone do(
  path   ::= nil
  commit ::= nil
  
  select := method(path, commit,
    clone setPath(path) setCommit(commit)
  )
  
  load := method(name,
    if(name isNil, name := guessNameFromPath(path))
    
  )
  
  guessNameFromPath := method(path,
    # TODO
    "default.io"
  )
)

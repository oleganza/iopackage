#!/usr/bin/env io

Package := Object clone do(
  url    ::= nil
  commit ::= nil
  
  select := method(url, commit,
    clone setUrl(url) setCommit(commit)
  )
  
  load := method(name,
    if(name isNil, name := guessNameFromPath(path))
    doFile(fullPathToFile(url, commit, name))
  )
  
  guessNameFromPath := method(path,
    # some magic here
    "default.io"
  )
  
  fullPathToFile := method(url, commit, filename,
    
  )
  
)

if(isLaunchScript,
  
)

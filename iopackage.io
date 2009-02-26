#!/usr/bin/env io

/*
  Flexible package manager for Io programming language.
  Author: Oleg Andreev <oleganza@gmail.com>
  
  Usage:
    Package require("git://github.com/oleganza/iojson.git", "1.0")
    Package select("git://github.com/oleganza/iojson.git", "1.0") load
    Package select(list("git://github.com/oleganza/iojson.git", "file:///var/git/iojson.git"), "1.0") load
    Package select(url, version) load("someFile.io")
    Package clone addSource(Package Git clone setVersion("1.0") addURL("git://github.com/oleganza/lib.git")) load("file.io")
    
*/

Package := Object clone do(
  url    ::= nil
  commit ::= nil
  
  select := method(url, commit,
    clone setUrl(url) setCommit(commit)
  )
  
  # Default name is "package-init.io"
  load := method(name,
    if(name isNil, name := defaultName)
    doFile(fullPathToFile(url, commit, name))
  )
  
  defaultName := "package-init.io"
  
  fullPathToFile := method(url, commit, filename,
    
  )
  
  Source := Object clone do(
    urls ::= List clone()
    version ::= nil
    appendURL := method(url, 
      urls append(url)
    )
  )
  
  Git := Source clone do(
    prepare := method(version, urls, 
      
    )
  )
  
)

if(isLaunchScript,
  
)

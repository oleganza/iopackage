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
  
  Special files:
    
    package-init.io is loaded by load() method if filename is not supplied
    package-install.io is executed by package installer once per installation
    .iopackage_installation is created on installation; contains Io object:
      Object clone do(
        date   := Date clone setDay(26) setMonth(2) setYear(2009) setHour(23) setMinute(5) setSecond(45)
        source := Package Git clone setVersion("1.0") addURL("git://.../repository.git")
      )
  
*/

Package := Object clone do(
  url    ::= nil
  commit ::= nil
  
  // Shortcut for select() load
  require := method(url, version,
    select(url, version) load
  )
  
  // Creates a new Package instance with prepared paths
  select := method(urls, version,
    // make a list out of string
    if(urls isKindOf(Sequence), urls = list(urls))
    package := clone
    urls foreach(url,
      package addGuessedSource(url, version)
    )
    package
  )
  
  // Guess the source and add it
  addGuessedSource := method(url, version,
    addSource(guessSource(url, version) setVersion(version) addURL(url))
  )
  
  // Add source
  addSource := method(source)
  
  // Loads source code and returns resulting object
  // Default name is "package-init.io"
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
      
      
      System system("git clone ")
    )
  )
  
)

if(isLaunchScript,
  
  Verify := doRelativeFile("verify.io")
  Verify clone do(
    methods := method(
      
    )
  )
)

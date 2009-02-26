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
    
    package-load.io is loaded by load() method if filename is not supplied
    package-install.io is executed by package installer once per installation
    .iopackage_installation is created on installation; contains Io object:
      Object clone do(
        date   := Date clone setDay(26) setMonth(2) setYear(2009) setHour(23) setMinute(5) setSecond(45)
        source := Package Git clone setVersion("1.0") addURL("git://.../repository.git")
      )
  
*/

Package := Object clone do(
  sources ::= list()
  
  loadFileName    := "package-load.io"
  installFileName := "package-install.io"
  infoFileName    := ".iopackage_installation"
  
  doRelativeFile("GuessSource.io")
  doRelativeFile("Sources.io")
    
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
  
  // Add source
  addSource := method(source,
    sources append(source)
    self
  )
  
  // Loads source code and returns resulting object
  // Default name is "package-init.io"
  load := method(name,
    if(name isNil, name := loadFileName) 
    doFile(fullPathToFile(url, version, name))
  )
  
  
  fullPathToFile := method(url, version, filename,
    ""
  )
  
  
  if(isLaunchScript, clone do(
    Verify := doRelativeFile("verify.io")
    Verify clone do(
      methods := method(
        verify(true)
      )
    ) run shortFormat println
  ))
  
  
)


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
  setupInfo ::= nil
  
  loadFileName    := "packageLoad.io"
  installFileName := "packageInstall.io"
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
    if(urls isKindOf(List) not, urls = list(urls))
    package := clone
    urls foreach(url,
      package addGuessedSource(url, version)
    )
    setSetupInfo(package setup)
    package
  )
    
  // Add source
  addSource := method(source,
    sources append(source)
    self
  )
  
  // Try one of the sources to set up and return setupInfo on success.
  // Raises Source SetupFailed when all sources failed to setup.
  setup := method(
    errors := list()
    sources foreach(source,
      e := try(setupInfo := source setup) 
      e catch(source SetupFailed, // catch polymorphic exception
        errors append(e error)
      ) pass // pass ther exceptions
      e ifNil(return setupInfo)
    )
    Source SetupFailed clone setErrors(errors) raise("All sources failed to setup! See SetupFailed errors for more info.")
  )
  
  // Loads source code and returns resulting object
  // Default name is loadFileName
  load := method(name,
    if(name isNil, name := loadFileName) 
    doFile(fullPathToFile(url, version, name))
  )
  
  
  fullPathToFile := method(url, version, filename,
    ""
  )
  
  
  if(isLaunchScript, clone do(
    lib := clone
    v := doRelativeFile("verify.io") clone
    v lib := lib
    v do(
      badConfiguration := method(
        verify( lib clone load )
      )
    ) run failureSummary println
  ))
  
  
)


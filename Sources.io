Source := Object clone do(
  urls ::= List clone()
  version ::= nil
  appendURL := method(url, 
    urls append(url)
  )
  
  SetupFailed := Exception do(
    errors ::= list()
    
  )
)

doRelativeFile("GitSource.io")
//TODO: doRelativeFile("HgSource.io")
//TODO: doRelativeFile("TarballSource.io")

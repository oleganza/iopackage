Source := Object clone do(
  urls ::= List clone()
  version ::= nil
  appendURL := method(url, 
    urls append(url)
  )
)

doRelativeFile("GitSource.io")
//TODO:doRelativeFile("HgSource.io")
//TODO:doRelativeFile("BundledSource.io")

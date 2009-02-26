
Git := Source clone do(
  prepare := method(version, urls, 
    
    
    System system("git clone ")
  )
)

// FIXME: always returns git source
GitRule := Object clone do(
  apply := method(url, version,
    Git
  )
)

appendURLRule(GitRule)

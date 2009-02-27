
Git := Source clone do(
  setup := method(version, url,
    
    
    System system("git clone ")
  )
)

// Returns Git for git urls and nil otherwise.
GitRule := Object clone do(
  source ::= nil
  apply := method(url, version,
    // FIXME: always returns git source
    source
  )
) setSource(Git)

appendURLRule(GitRule)

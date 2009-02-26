
// Guess the source and add it
addGuessedSource := method(url, version,
  addSource(guessSource(url, version) setVersion(version) addURL(url))
)

guessSourceRules := list()
guessSource := method(url, version,
  guessSourceRules foreach(rule,
    rule apply(url, version) returnIfNonNil
  )
  Exception raise("No guessSource rule for #{url} version #{version}!" interpolate)
)

prependURLRule := method(rule, guessSourceRules prepend(rule); self)
appendURLRule := method(rule, guessSourceRules append(rule); self)

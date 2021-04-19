## Install dependencies

`bundle install`

## Example usage:

`ruby init.rb -f data/Batting.csv -y 1872 -t 'Baltimore Canaries'`

result:

PLAYER    | YEAR | TEAM               | BA
----------|------|--------------------|------
mathebo01 | 1872 | Baltimore Canaries | 0.225
fishech01 | 1872 | Baltimore Canaries | 0.231
yorkto01  | 1872 | Baltimore Canaries | 0.264
cravebi01 | 1872 | Baltimore Canaries | 0.281
radcljo01 | 1872 | Baltimore Canaries | 0.29
careyto01 | 1872 | Baltimore Canaries | 0.291
millsev01 | 1872 | Baltimore Canaries | 0.297
pikeli01  | 1872 | Baltimore Canaries | 0.298
hastisc01 | 1872 | Baltimore Canaries | 0.306
hallge01  | 1872 | Baltimore Canaries | 0.336
highadi01 | 1872 | Baltimore Canaries | 0.343
forceda01 | 1872 | Baltimore Canaries | 0.432

## Tests
To run tests:

`ruby tests/players_test.rb`

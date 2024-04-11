import ../levenshtein, unittest
from sequtils import toSeq

suite "levenshtein":
  test "strings":
    check "aaaardvark".levenshtein("ardvark") == 3
    check "aardvarkk".levenshtein("arrdvark") == 2
    check "kitten".levenshtein("sitten") == 1
    check " kitten".levenshtein("kitten") == 1
    check "kitten".levenshtein("kitten") == 0
    check "".levenshtein("hello") == 5
    check "hello".levenshtein("") == 5

  test "seqs":
    check "external".levenshtein(@['e', 'x', 't', 'r', 'a', 'v', 'a', 'g', 'a', 'n', 't']) == 7
    check @['d', 'a', 'n', 'c', 'e'].levenshtein("daniel") == 2
    check toSeq(0..5).levenshtein(toSeq(0..6)) == 1
    check @[1, 1, 2, 3].levenshtein(toSeq(1..3)) == 1
    check @[1, 2, 3].levenshtein(toSeq(1..7)) == 4
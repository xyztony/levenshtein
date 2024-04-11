from sequtils import toSeq
# Implementation of psuedocode LD: https://en.wikipedia.org/wiki/Levenshtein_distance#Iterative_with_two_matrix_rows
proc levenshtein*[T](a, b: openArray[T]): int =
  let 
    m = a.len
    n = b.len

  if m == 0:
    return n
  elif n == 0:
    return m
  else:
    var 
      v0 = toSeq(0..n)
      v1 = newSeq[int](n+1)
      deletionCost, insertionCost, substitutionCost: int

    assert v0.len == n+1
    for i in 0..m - 1:
      v1[0] = i + 1
      for j in 0..n - 1:
        deletionCost = v0[j + 1] + 1
        insertionCost = v1[j] + 1
        if a[i] == b[j]:
          substitutionCost = v0[j]
        else:
          substitutionCost = v0[j] + 1

        v1[j + 1] = min(@[deletionCost, insertionCost, substitutionCost])
      swap(v0, v1)
    return v0[n]
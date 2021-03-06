//Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
//
//1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
//
//By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

var fibonnaci = [1, 2]
var (penultimate, last) = (fibonnaci[0], fibonnaci[1])
var next = fibonnaci[0] + fibonnaci[1]

while next < 4_000_000 {
    (penultimate, last) = (fibonnaci[fibonnaci.count - 1], next)
    fibonnaci += next
    next = penultimate + last
}

let reducedSum = fibonnaci.reduce(0, combine:
                                    {sum, value in
                                        if (value % 2 == 0) {
                                            return sum + value
                                        }
                                        return sum
                                    })

reducedSum

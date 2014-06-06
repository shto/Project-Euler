// Playground - noun: a place where people can play

var numbersArray :Int[] = []
for number in 3..1000 {
    if number % 3 == 0 || number % 5 == 0 {
        numbersArray += number
    }
}

let sumOfNumbers = numbersArray.reduce(0, combine: {acumulator, value in acumulator + value})
sumOfNumbers
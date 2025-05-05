import Darwin

// История вычислений
var history: [String] = []

// MARK: - Главная программа

print("Welcome to the Calculator Program!")

while true {
    let action = getDataFromUser(description: "Choose an action: c – calculate, h – history, q – quit")
    switch action.lowercased() {
    case "c":
        calculateExample()
    case "h":
        showHistory()
    case "q":
        exit(0)
    default:
        print("Unknown action. Please try again.")
    }
}

// MARK: - Основная логика

func calculateExample() {
    let operation = getDataFromUser(description: "Choose an operation: +, -, *, /")
    guard ["+", "-", "*", "/"].contains(operation) else {
        print("Invalid operation.")
        return
    }

    let firstInput = getDataFromUser(description: "Enter the first number:")
    guard let firstNumber = Int(firstInput) else {
        print("Invalid first number.")
        return
    }

    let secondInput = getDataFromUser(description: "Enter the second number:")
    guard let secondNumber = Int(secondInput) else {
        print("Invalid second number.")
        return
    }

    print("Calculating: \(firstNumber) \(operation) \(secondNumber)")

    guard let result = performCalculation(operation: operation, firstNumber: firstNumber, secondNumber: secondNumber) else {
        return
    }

    showResult(result)

    let example = "\(firstNumber) \(operation) \(secondNumber) = \(result)"
    history.append(example)
}

// MARK: - Вспомогательные функции

func getDataFromUser(description: String) -> String {
    print(description)
    return readLine() ?? ""
}

func performCalculation(operation: String, firstNumber: Int, secondNumber: Int) -> Int? {
    switch operation {
    case "+":
        return firstNumber + secondNumber
    case "-":
        return firstNumber - secondNumber
    case "*":
        return firstNumber * secondNumber
    case "/" where secondNumber == 0:
        print("Cannot divide by 0.")
        return nil
    case "/":
        return firstNumber / secondNumber
    default:
        print("Unsupported operation.")
        return nil
    }
}

func showResult(_ result: Int) {
    print("Result: \(result)")
}

func showHistory() {
    if history.isEmpty {
        print("No calculations yet.")
    } else {
        print("Calculation History:")
        for example in history {
            print(example)
        }
    }
}

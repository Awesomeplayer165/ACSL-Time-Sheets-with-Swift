import Foundation

enum Location {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
}

class WorkInformation {
    let location:  Int
    let startTime: Double
    let endTime:   Double

    init(location: Int, startTime: Double, endTime: Double) {
        self.location  = location
        self.startTime = startTime
        self.endTime   = endTime
    }
}

func getInput() -> [String] {
    print("Enter input: ", terminator: "")
   let input = readLine()!.replacingOccurrences(of: " ", with: "")
		// "17, 1, E"
		// let input = "5, 9, H"
		// "11, 1, 7"
		// "19, 3, F"
		// "25, 2, B"

		// input = input.replacingOccurrences(of: " ", with: "")

    let inputArray = input.components(separatedBy: ",")

    guard inputArray.count == 3 else { fatalError() }

    return inputArray
}

func translateInput(userInput: [String]) -> WorkInformation {
    let location  = Int(userInput[0])!
    var startTime = Double.zero
    var endTime   = Double.zero

    // switch userInput[0] {
    //     case "1": location = .one
    //     case "2": location = .two
    //     case "3": location = .three
    //     case "4": location = .four
    //     case "5": location = .five
    //     case "6": location = .six
    //     case "7": location = .seven
    //     case "8": location = .eight
    //     case "9": location = .nine
    //     case "A": location = .a
    //     case "B": location = .b
    //     case "C": location = .c
    //     case "D": location = .d
    //     case "E": location = .e
    //     case "F": location = .f
    //     case "G": location = .g
    //     case "H": location = .h
    //     default:  break
    // }

    switch userInput[1] {
        case "1": startTime = 9
        case "2": startTime = 9.5
        case "3": startTime = 10
        case "4": startTime = 10.5
        case "5": startTime = 11
        case "6": startTime = 11.5
        case "7": startTime = 12
        case "8": startTime = 12.5
        case "9": startTime = 1
        case "A": startTime = 1.5
        case "B": startTime = 2
        case "C": startTime = 2.5
        case "D": startTime = 3
        case "E": startTime = 3.5
        case "F": startTime = 4
        case "G": startTime = 4.5
        case "H": startTime = 5
        default:  break
    }

    switch userInput[2] {
        case "1": endTime = 9
        case "2": endTime = 9.5
        case "3": endTime = 10
        case "4": endTime = 10.5
        case "5": endTime = 11
        case "6": endTime = 11.5
        case "7": endTime = 12
        case "8": endTime = 12.5
        case "9": endTime = 1
        case "A": endTime = 1.5
        case "B": endTime = 2
        case "C": endTime = 2.5
        case "D": endTime = 3
        case "E": endTime = 3.5
        case "F": endTime = 4
        case "G": endTime = 4.5
        case "H": endTime = 5
        default:  break
    }

    return WorkInformation(location: location, startTime: startTime, endTime: endTime)
}

func calculation(with workInformation: WorkInformation) -> Double {
    dump(workInformation)
    let endTime = workInformation.endTime >= 1 && workInformation.endTime < 9 ? workInformation.endTime + 12 : workInformation.endTime
    let startTime = workInformation.startTime >= 1 && workInformation.startTime < 9 ? workInformation.startTime + 12 : workInformation.startTime
    let hoursWorked = abs(endTime - startTime)
    print(startTime, endTime)
    switch workInformation.location {
        case 1...9:
        return abs(workInformation.endTime - workInformation.startTime) * 10.0
        case 10...19:

        if hoursWorked <= 4 { return hoursWorked * 8 }
        else {
            return 32 +  (hoursWorked - 4) * 12
        }

        case 20...29:

        if hoursWorked <= 4 { return hoursWorked * 12 }
        else {
            return 48 + (hoursWorked - 4) * 24
        }

        default: return 10000000
    }
}

let workInformation = translateInput(userInput: getInput())
print("$\(calculation(with: workInformation))0")

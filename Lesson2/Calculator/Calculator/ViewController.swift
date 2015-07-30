

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var Display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
        Display.text = Display.text! + digit
        } else {
            Display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }

    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        case "×": performOperation { $0 * $1 }
        case "÷": performOperation { $1 / $0 }
        case "+": performOperation { $0 + $1 }
        case "-": performOperation { $1 - $0 }
        case "√": performOperation1 { sqrt($0)}
        default: break
        }
    }
    
    var operandStack = Array<Double>()
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    //Error: performOperation conflicts with previous declaration with the same Objective-C selector
    func performOperation1(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    
        
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(Display.text!)!.doubleValue
        }
        set {
            Display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}


import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var Display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber: Bool = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
        Display.text = Display.text! + digit
        } else {
            Display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }


}


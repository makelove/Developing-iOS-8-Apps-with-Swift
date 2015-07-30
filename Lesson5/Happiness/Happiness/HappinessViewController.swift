

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{
    var happiness: Int = 50 { //0 =very sad, 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            println("happiness = \(happiness)")
            updateUI()
        }
    }
    
    func updateUI()
    {
        
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
}

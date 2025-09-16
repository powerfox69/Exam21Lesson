

import UIKit

extension UIView {
    
    func countUIButtons(_ views: UIView...) -> Int {
        var buttonCount = 0
        
        for view in views {
            if view is UIButton {
                buttonCount += 1
            }
        }
        return buttonCount
    }
    
        func printAllSubViews(_ views: UIView...) {
            for view in views {
                if let button = view as? CustomButton {
                    print(button.elementName ?? "Unowned name")
                }
            }
        }
    }




import UIKit

extension UIStackView {
    func addArrangedSubview(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}

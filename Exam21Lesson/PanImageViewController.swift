import UIKit

class PanImageViewController: UIViewController {
    private let imageNavigator: ImageNavigable
    private let imageView = UIImageView()
    
    private var panGestureRecognizer: UIPanGestureRecognizer!
    private var panGestureAnchorPoint: CGPoint?
    private var centerXConstraint: NSLayoutConstraint!
    private var centerYConstraint: NSLayoutConstraint!
    
    init(imageNavigator: ImageNavigable) {
        self.imageNavigator = imageNavigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPanImageViewController()
    }
}

private extension PanImageViewController {
    func setupPanImageViewController() {
        view.backgroundColor = .white
        setupImageView()
        view.addSubview(imageView)
        setupLayout()
        setupGestureRecognizers()
    }
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemBrown
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.image = .image1
        imageView.isUserInteractionEnabled = true
    }
    
    private func setupGestureRecognizers() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector (handlePanGesture(_:)))
        imageView.addGestureRecognizer(panGestureRecognizer)
    }
}

//MARK: - Setup Layout
    private extension PanImageViewController {
        func setupLayout() {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            centerXConstraint = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            centerYConstraint = imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
            NSLayoutConstraint.activate([
               
                centerXConstraint,
                centerYConstraint,
                imageView.widthAnchor.constraint(equalToConstant: 300),
                imageView.heightAnchor.constraint(equalToConstant: 300)
            ])
        }
    }

// MARK: - Gesture Handling
private extension PanImageViewController {
    @objc func handlePanGesture(_ gestureRecognizer: UIGestureRecognizer) {
        switch gestureRecognizer.state {
            
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            let gesturePoint = gestureRecognizer.location(in: view)
            
            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            centerYConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
            
            self.panGestureAnchorPoint = gesturePoint
        case .cancelled, .ended:
            panGestureAnchorPoint = nil
        case .possible, .failed:
            break
        @unknown default:
            break
        }
    }
}

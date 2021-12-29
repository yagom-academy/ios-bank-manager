import UIKit

class ViewController: UIViewController {
    var backgroundStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundStackView()
    }
}

extension ViewController {
    private func setUpBackgroundStackView() {
        view.addSubview(backgroundStackView)
        backgroundStackView.axis = .vertical
        backgroundStackView.backgroundColor = .brown
        
        backgroundStackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        backgroundStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

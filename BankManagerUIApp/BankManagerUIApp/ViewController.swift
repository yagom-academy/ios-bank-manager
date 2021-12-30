import UIKit

class ViewController: UIViewController {
    var backgroundStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundStackView()
        setUPButtonStackView()
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
    
    private func setUPButtonStackView() {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.backgroundColor = .yellow
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.alignment = .top
        backgroundStackView.addArrangedSubview(buttonStackView)
        
        let addCustomerButton = UIButton(type: .system)
        addCustomerButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        addCustomerButton.setTitle("고객 10명 추가", for: .normal)
        
        let resetButton = UIButton(type: .system)
        resetButton.setTitle("초기화", for: .normal)
        resetButton.tintColor = .red
        resetButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        
        buttonStackView.addArrangedSubview(addCustomerButton)
        buttonStackView.addArrangedSubview(resetButton)
    }
}

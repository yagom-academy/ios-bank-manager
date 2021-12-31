import UIKit

class ViewController: UIViewController {
    let mainStackView: UIStackView = UIStackView()
    let buttonStackView: UIStackView = UIStackView()
    let addClientButton = UIButton()
    let initializationButton = UIButton()
    
    override func loadView() {
        view = .init()
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        configureMainStackView()
        mainStackView.addArrangedSubview(buttonStackView)
        configureButtonStackView()
        configureButtons()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.alignment = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configureButtonStackView() {
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.alignment = .leading
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.addArrangedSubview(addClientButton)
        buttonStackView.addArrangedSubview(initializationButton)
    }
    
    private func configureButtons() {
        addClientButton.setTitle("고객 10명 추가", for: .normal)
        addClientButton.setTitleColor(.systemBlue, for: .normal)
        addClientButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        initializationButton.setTitle("초기화", for: .normal)
        initializationButton.setTitleColor(.systemRed, for: .normal)
        initializationButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
    }
}

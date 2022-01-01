import UIKit

class ViewController: UIViewController {
    let mainStackView: UIStackView = UIStackView()
    let buttonStackView: UIStackView = UIStackView()
    let labelStackView: UIStackView = UIStackView()
    let scrollStackView: UIStackView = UIStackView()
    let leftScrollView: UIScrollView = UIScrollView()
    let rightScrollView: UIScrollView = UIScrollView()
    let addClientButton = UIButton()
    let initializationButton = UIButton()
    let timerLabel: TimerLabel = TimerLabel()
    
    override func loadView() {
        view = .init()
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        configureMainStackView()
        mainStackView.addArrangedSubview(buttonStackView)
        configureButtonStackView()
        configureButtons()
        mainStackView.addArrangedSubview(timerLabel)
        mainStackView.addArrangedSubview(labelStackView)
        configureLabelStackView()
        configureScrollStackView()
        mainStackView.addArrangedSubview(scrollStackView)
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
    
    private func configureLabelStackView() {
        labelStackView.axis = .horizontal
        labelStackView.distribution = .fillEqually
        labelStackView.alignment = .leading
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        let watingLabel = UILabel()
        watingLabel.text = "대기중"
        watingLabel.font = .preferredFont(forTextStyle: .title1)
        watingLabel.textColor = .white
        watingLabel.backgroundColor = .systemGreen
        watingLabel.textAlignment = .center
        let workingLabel = UILabel()
        workingLabel.text = "업무중"
        workingLabel.font = .preferredFont(forTextStyle: .title1)
        workingLabel.textColor = .white
        workingLabel.backgroundColor = .systemIndigo
        workingLabel.textAlignment = .center
        labelStackView.addArrangedSubview(watingLabel)
        labelStackView.addArrangedSubview(workingLabel)
    }
    
    private func configureScrollStackView() {
        scrollStackView.axis = .horizontal
        scrollStackView.distribution = .fillEqually
        scrollStackView.alignment = .fill
        scrollStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollStackView.addArrangedSubview(leftScrollView)
        scrollStackView.addArrangedSubview(rightScrollView)
    }
}

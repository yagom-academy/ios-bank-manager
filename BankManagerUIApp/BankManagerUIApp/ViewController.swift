import UIKit

class ViewController: UIViewController {
    // MARK: View property
    let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let addedButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "업무시간 - "
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let waitingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "대기중"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let workingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "업무중"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView .translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let currentStatusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let currentWatingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let currentWorkingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        configureRootStackView()
        configurecurrentStatusStackView()
    }
    
    // MARK: Methods
    private func addView() {
        self.view.addSubview(rootStackView)
        [buttonStackView, timerLabel, statusStackView, statusScrollView].forEach {
            rootStackView.addArrangedSubview($0)
        }
        [addedButton, resetButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        [waitingLabel, workingLabel].forEach {
            statusStackView.addArrangedSubview($0)
        }
        [currentWatingStackView, currentWorkingStackView].forEach {
            currentStatusStackView.addArrangedSubview($0)
        }
        statusScrollView.addSubview(currentStatusStackView)
    }
    
    private func configureRootStackView() {
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func configurecurrentStatusStackView() {
        NSLayoutConstraint.activate([
            currentStatusStackView.topAnchor.constraint(equalTo: statusScrollView.contentLayoutGuide.topAnchor),
            currentStatusStackView.bottomAnchor.constraint(equalTo: statusScrollView.contentLayoutGuide.bottomAnchor),
            currentStatusStackView.leadingAnchor.constraint(equalTo: statusScrollView.frameLayoutGuide.leadingAnchor),
            currentStatusStackView.trailingAnchor.constraint(equalTo: statusScrollView.frameLayoutGuide.trailingAnchor)
        ])
    }
}

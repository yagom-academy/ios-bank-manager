import UIKit

class CustomerListStackView: UIStackView {
    
    var notifyLabel = UILabel()
    var listScrollView = UIScrollView()
    var listStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(title: String, color: UIColor) {
        self.init()
        setUp()
        notifyLabel.text = title
        notifyLabel.backgroundColor = color
    }
    
    private func setUp() {
        axis = .vertical
        spacing = 12
        translatesAutoresizingMaskIntoConstraints = false
        setUpNotifyLabel()
        setUpListStackView()
        addSubviews()
        setUpLayout()
    }
    
    private func addSubviews() {
        addArrangedSubview(notifyLabel)
        addArrangedSubview(listScrollView)
        listScrollView.addSubview(listStackView)
    }
    
    private func setUpNotifyLabel() {
        notifyLabel.font = .preferredFont(forTextStyle: .title1)
        notifyLabel.textColor = .white
        notifyLabel.textAlignment = .center
    }
    
    private func setUpListStackView() {
        listStackView.axis = .vertical
        listStackView.spacing = 8
        listStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpLayout() {
        listStackView.topAnchor.constraint(equalTo: listScrollView.topAnchor).isActive = true
        listStackView.bottomAnchor.constraint(equalTo: listScrollView.bottomAnchor).isActive = true
        listStackView.leadingAnchor.constraint(equalTo: listScrollView.leadingAnchor).isActive = true
        listStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        listStackView.widthAnchor.constraint(equalTo: listScrollView.widthAnchor).isActive = true
        let listStackViewHeight = listStackView.heightAnchor.constraint(equalTo: listScrollView.heightAnchor)
        listStackViewHeight.priority = .defaultLow
        listStackViewHeight.isActive = true
    }
    
    func addCustomerLabel(_ label: UILabel) {
        listStackView.addArrangedSubview(label)
    }
}

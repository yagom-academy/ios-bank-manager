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
        setUpNotifyLabel(title, color)
        setUpListStackView()
        addSubviews()
        setUpLayout()
    }
    
    private func setUp() {
        axis = .vertical
        spacing = 12
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        addArrangedSubview(notifyLabel)
        addArrangedSubview(listScrollView)
        listScrollView.addSubview(listStackView)
    }
    
    private func setUpNotifyLabel(_ title: String, _ color: UIColor) {
        notifyLabel.text = title
        notifyLabel.backgroundColor = color
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
    
    func addCustomerLabel(_ label: UILabel?) {
        guard let customerLabel = label else {
            return
        }
        listStackView.addArrangedSubview(customerLabel)
    }
    
    @discardableResult
    func removeLabel(at waitingNumber: Int) -> UILabel? {
        guard let customerLabel = listStackView.arrangedSubviews
                                               .compactMap({ $0 as? CustomerLabel })
                                               .filter({ $0.waitingNumber == waitingNumber })
                                               .first else {
            return nil
        }
        customerLabel.removeFromSuperview()

        return customerLabel
    }
    
    func clear() {
        listStackView.arrangedSubviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
}

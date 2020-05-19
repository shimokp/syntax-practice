import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var stackView: UIStackView! {
        didSet {
            stackView.axis = .vertical
            stackView.distribution = .fill
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let view1 = UIView()
        view1.backgroundColor = .systemOrange
        view1.heightAnchor.constraint(equalToConstant: 44).isActive = true
        stackView.addArrangedSubview(view1)
    }

    override func viewDidLayoutSubviews() {
        print(stackView.frame.height)
    }
}

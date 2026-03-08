import UIKit

final class ViewController: UIViewController {
    private let intentMessages = [
        "Translating your idea into pixels…",
        "Warming up the app brain…",
        "Assembling the first screen…",
        "Brewing a working prototype…",
        "Making it real, one view at a time…",
    ]
    private var messageIndex = 0
    private var messageTimer: Timer?

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let label = UILabel()
        label.text = "__APP_NAME__"
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false

        subtitleLabel.text = intentMessages[messageIndex]

        let iconView = UIImageView(image: UIImage(systemName: "app.fill"))
        iconView.tintColor = .white
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 44),
            iconView.heightAnchor.constraint(equalTo: iconView.widthAnchor)
        ])

        let iconBackground = UIView()
        iconBackground.translatesAutoresizingMaskIntoConstraints = false
        iconBackground.backgroundColor = .tintColor
        iconBackground.layer.cornerRadius = 26
        iconBackground.layer.cornerCurve = .continuous
        iconBackground.layer.shadowColor = UIColor.black.cgColor
        iconBackground.layer.shadowOpacity = 0.18
        iconBackground.layer.shadowRadius = 12
        iconBackground.layer.shadowOffset = CGSize(width: 0, height: 6)
        iconBackground.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconBackground.widthAnchor.constraint(equalToConstant: 104),
            iconBackground.heightAnchor.constraint(equalTo: iconBackground.widthAnchor),
            iconView.centerXAnchor.constraint(equalTo: iconBackground.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: iconBackground.centerYAnchor)
        ])

        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()

        let stack = UIStackView(arrangedSubviews: [iconBackground, label, subtitleLabel, spinner])
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        messageTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.messageIndex = (self.messageIndex + 1) % self.intentMessages.count
            self.subtitleLabel.text = self.intentMessages[self.messageIndex]
        }
    }

    deinit {
        messageTimer?.invalidate()
    }
}

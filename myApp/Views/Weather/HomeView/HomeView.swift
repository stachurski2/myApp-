import SnapKit
import UIKit

class HomeView: UIView {

    private let kProceedButtonTopMargin: CGFloat = 50

    private let kProceedButtonBottomMargin: CGFloat = 50

    private let kImageCentringXdifference: CGFloat = 20

    private let kButtonCornerRadius: CGFloat = 10

    private let logo: UIImageView = {
        let imageview = UIImageView(image: #imageLiteral(resourceName: "logo"))
        imageview.contentMode = .scaleToFill
        return imageview
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        let text = String.getLocalized(with: "title_app")
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var proceedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(String.getLocalized(with: "home_button_start"), for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        button.layer.cornerRadius = kButtonCornerRadius
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return button
    }()

    private let containerView: UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupContainerView()
        setupContainerViewConstraints()

        setUpProceedButton()
        setUpProceedButtonConstraints()

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupContainerView() {
        addSubview(containerView)
        containerView.addSubview(logo)
        containerView.addSubview(titleLabel)
    }

    private func setupContainerViewConstraints() {
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview()
        }

        guard let image = logo.image else {
            return
        }
        logo.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(kImageCentringXdifference)
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(logo.snp.width).multipliedBy(image.size.height / image.size.width)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom)
            make.centerX.equalToSuperview()
            make.left.right.bottom.equalToSuperview()
        }
    }

    private func setUpProceedButton() {
        addSubview(proceedButton)
    }

    private func setUpProceedButtonConstraints() {
        proceedButton.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.top.greaterThanOrEqualTo(containerView.snp.bottom).offset(kProceedButtonTopMargin)
        make.bottom.greaterThanOrEqualToSuperview().offset(-kProceedButtonBottomMargin)
        }
    }

    public func setTargetForProceedButton(_ target: Any?,
                                          action: Selector,
                                          for controlEvents: UIControlEvents) {
        proceedButton.addTarget(target, action: action, for: controlEvents)
    }

}

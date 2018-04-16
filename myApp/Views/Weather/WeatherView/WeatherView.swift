import SnapKit
import UIKit

class WeatherView: UIView {

    private let ktopNavigationBar: CGFloat = 8.0

    private let kBackButtonBottomMargin: CGFloat = 50.0

    private let navigationBar = UINavigationBar()

    private let kButtonCornerRadius: CGFloat = 10.0

    private let kdeafultMargin: CGFloat = 8.0

    private let kImageSize: CGFloat = 100.0

    private let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: .zero)
        indicator.isHidden = true
        indicator.activityIndicatorViewStyle = .gray
        return indicator
    }()

    private lazy var backbutton: UIButton = {
        let button = UIButton()
        button.setTitle(String(withlocalized: "back_button_title"), for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        button.layer.cornerRadius = kButtonCornerRadius
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.isHidden = true
        return button
    }()

    private let infoView = UIView()

    private let weatherImageView = UIImageView()

    private let dateLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let weatherDescribeLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()

    lazy var style: NSMutableParagraphStyle = {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = kdeafultMargin
        return style
    }()

    private lazy var describeLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .left
        let text1 = "\(String(withlocalized: "temperture")) \n\(String(withlocalized: "max_temperature"))"
        let text2 = "\(String(withlocalized: "min_temperature")) \n\(String(withlocalized: "pressure"))"
        let text3 = String(withlocalized: "wind_speed")
        let text = NSMutableAttributedString(string: text1 + "\n" + text2 + "\n" + text3)
        var range = NSRange()
        range.location = 0
        range.length = text.length
        text.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: range )
        label.attributedText = text
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    private let dataLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(navItems: [UINavigationItem]) {
        super.init(frame: .zero)
        setUpView()
        setUpConstraints()
        navigationBar.setItems(navItems, animated: false)
    }
    private func setUpView() {
        addSubview(navigationBar)
        addSubview(indicator)
        addSubview(backbutton)
        addSubview(infoView)
        infoView.addSubview(weatherImageView)
        infoView.addSubview(dateLabel)
        infoView.addSubview(weatherDescribeLabel)
        infoView.addSubview(describeLabel)
        infoView.addSubview(dataLabel)
        }

    private func setUpConstraints() {
        navigationBar.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(ktopNavigationBar)
        }
        indicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        backbutton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-kBackButtonBottomMargin)
            make.centerX.equalToSuperview()
        }
        infoView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(backbutton).offset(-kBackButtonBottomMargin)
        }
        weatherImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(kdeafultMargin)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(kImageSize)
        }
        dateLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-kdeafultMargin)
            make.left.right.equalToSuperview()
        }
        weatherDescribeLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView.snp.bottom).offset(kdeafultMargin)
            make.centerX.equalToSuperview()
        }
        describeLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherDescribeLabel.snp.bottom).offset(kdeafultMargin)
            make.left.equalToSuperview().offset(kdeafultMargin)
        }
        dataLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherDescribeLabel.snp.bottom).offset(kdeafultMargin)
            make.left.greaterThanOrEqualTo(describeLabel.snp.right).offset(kdeafultMargin)
            make.right.equalToSuperview().offset(-kdeafultMargin)
        }

    }
    public func changeIndicatorAnimate(_ visibilty: Bool = false) {
        if visibilty {
            indicator.isHidden = false
            indicator.startAnimating()
        } else {
            indicator.isHidden = true
            indicator.stopAnimating()
        }
    }

    public func showWeather(weather: Weather) {
        describeLabel.isHidden = false
        backbutton.isHidden = false
        changeIndicatorAnimate()
        weatherImageView.image = weather.image
        weatherDescribeLabel.text = weather.describe
        weatherDescribeLabel.text?.capitalizeFirstLetter()
        dateLabel.text = "Data updated at \n \(weather.time)"
        let text1 = "\(weather.temperature) \u{00B0}C\n\(weather.maxTemperature) \u{00B0}C\n"
        let text2 = "\(weather.minTemperature) \u{00B0}C\n\(weather.pressure)HPa\n"
        let text3 = "\(weather.wind) m/s"
        let text = NSMutableAttributedString(string: text1 + text2 + text3)
        var range = NSRange()
        range.location = 0
        range.length = text.length
        text.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: range)
        dataLabel.attributedText = text
    }

    public func defineTextFieldFunctionTarget(target: Any, action: Selector, event: UIControlEvents) {
        backbutton.addTarget(target, action: action, for: event)
    }

}

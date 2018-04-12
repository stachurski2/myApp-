import Foundation

extension String {
    static func getLocalized(with key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    init(withlocalized key: String) {
        self.init(describing: NSLocalizedString(key, comment: ""))
    }
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

}

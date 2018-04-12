import UIKit

class HomeViewController: UIViewController {

    var homeView: HomeView {
        guard let homeView = view as? HomeView else {
            return HomeView() }
        return homeView
    }

    override func loadView() {
        let contentView = HomeView(frame: .zero)
        view = contentView
        defineMethods()
    }

    func defineMethods() {
        homeView.setTargetForProceedButton(self, action: #selector(HomeViewController.proceed), for: .touchUpInside)
    }

    @objc
    func proceed() {
        present(SearchViewController(), animated: true, completion: nil)
    }
}

import SwiftUI
import UIKit

struct NavigationSearch: UIViewControllerRepresentable {
    typealias UIViewControllerType = Wrapper

    func makeCoordinator() -> Coordinator {
        Coordinator(representable: self)
    }

    func makeUIViewController(context: Context) -> Wrapper {
        let wrapper = Wrapper()
        wrapper.navigationItem.searchController = context.coordinator.searchController
        wrapper.navigationItem.hidesSearchBarWhenScrolling = false
        return wrapper
    }

    func updateUIViewController(_ wrapper: Wrapper, context: Context) {
        // Update properties if needed
    }

    class Coordinator: NSObject {
        let representable: NavigationSearch
        let searchController: UISearchController

        init(representable: NavigationSearch) {
            self.representable = representable
            self.searchController = UISearchController(searchResultsController: nil)
            super.init()
            self.searchController.obscuresBackgroundDuringPresentation = false
            self.searchController.searchBar.placeholder = "Search"
        }
    }

    class Wrapper: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
        }
    }
}

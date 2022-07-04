
import UIKit

class SegmentViewController: UIViewController {

    let imageArray = [UIImage(named: "dog1"),
                      UIImage(named: "dog2"),
                      UIImage(named: "dog3"),
                      UIImage(named: "dog4")]
    
    let numbersArray = ["one", "two", "three", "four"]
    
    private lazy var segment: UISegmentedControl = {
        let segment = UISegmentedControl(items: self.numbersArray)
        segment.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = imageArray[0]
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawSelf()
    }
    
    private func drawSelf() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(segment)
        let leftSegmentConst = segment.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        let rightSegmentConst = segment.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        let bottomSegmentConst = segment.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        let heightSegmentConst = segment.heightAnchor.constraint(equalToConstant: 60)
        
        view.addSubview(imageView)
        let leftImageConst = imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        let rightImageConst = imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        let topImageConst = imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40)
        let bottomImageConst = imageView.bottomAnchor.constraint(equalTo: segment.topAnchor, constant: -40)
        
        NSLayoutConstraint.activate([leftSegmentConst, rightSegmentConst, bottomSegmentConst, heightSegmentConst, leftImageConst, rightImageConst, topImageConst, bottomImageConst])
    }
    
    @objc private func selectedValue(target: UISegmentedControl){
        if target == self.segment {
            let selectedIndex = target.selectedSegmentIndex
            self.imageView.image = imageArray[selectedIndex]
        }
    }
    
}

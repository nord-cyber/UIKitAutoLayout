//
//  CollectionViewController.swift
//  BearImageView
//
//  Created by Vadzim Ivanchanka on 28.01.21.
//

import UIKit

private let reuseIdentifier = "cellId"

extension UIColor {
    static var pinkColor = UIColor(red: 249/255, green: 98/255, blue: 188/255, alpha: 1)
    static var pinkColorLight = UIColor(red: 200/255, green: 130/255, blue: 200/255, alpha: 0.8)
}

class CollectionViewController: UICollectionViewController {
    
    
    
    
    var arrayWithElementsPage:[Page] = [Page(imageName: "bear_image", headerText: "Joint to us chat!", bodyText: "Here we have fun communication and games!"), Page(imageName: "bear_image", headerText: "Use this chance!", bodyText: "When you click on this button you deep in crazy world!"), Page(imageName: "bear_image", headerText: "Do it!", bodyText: "You always cancel all changes in your card!")]

    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.collectionView!.register(PageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setupBarButtons()
        collectionView.backgroundColor = .white
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayWithElementsPage.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageCell
        
        cell.page = arrayWithElementsPage[indexPath.item]
        return cell
    }
    
    
    
    // MARK: Bar buttons setup and page control
    
    private var previousButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.pinkColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var nextButton:UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.pinkColor, for: .normal)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var pageControl:UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.numberOfPages = 4
        page.currentPageIndicatorTintColor = .red
        page.pageIndicatorTintColor = .pinkColorLight
        return page
    }()
    
    fileprivate func setupBarButtons() {
        
        let stackViewBarButtons = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        
        stackViewBarButtons.distribution = .fillEqually
        stackViewBarButtons.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackViewBarButtons)
        
        // setup layout bar items
        NSLayoutConstraint.activate([
            stackViewBarButtons.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackViewBarButtons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackViewBarButtons.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackViewBarButtons.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

}




extension CollectionViewController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}




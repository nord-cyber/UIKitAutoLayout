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
    
    let pages = Page.pages
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.collectionView!.register(PageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setupBarButtons()
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageCell
        
        let pages = self.pages
        cell.page = pages[indexPath.item]
        return cell
    }
    
    
    
    // MARK: Bar buttons setup and page control
    
    private var previousButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.pinkColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrevPageButton), for: .touchUpInside)
        return button
    }()
    
    private var nextButton:UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.pinkColor, for: .normal)
        button.setTitle("NEXT", for: .normal)
        button.addTarget(self, action: #selector(handleNextPageButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func handleNextPageButton() {
        
        let item = min(pageControl.currentPage + 1, pages.count - 1) // сопостовление двух чисел
        let indexPath = IndexPath(item: item, section: 0)
        pageControl.currentPage = item
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    @objc private func handlePrevPageButton() {
         
        let item = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: item, section: 0)
        pageControl.currentPage = item
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    private lazy var pageControl:UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.numberOfPages = pages.count
        page.currentPageIndicatorTintColor = .red
        page.pageIndicatorTintColor = .pinkColorLight
        return page
    }()
    
    fileprivate func setupBarButtons() {
        
        let stackViewBarButtons = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        
        stackViewBarButtons.distribution = .fillProportionally
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
    
    // for swipe in controller
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width) // = 1..2..3..4..5
    }
}




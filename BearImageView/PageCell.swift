//
//  PageCell.swift
//  BearImageView
//
//  Created by Vadzim Ivanchanka on 28.01.21.
//

import UIKit



class PageCell: UICollectionViewCell {
    
    
    var page:Page? {
        didSet {
            guard let unwrappedPage = page else {return}
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            
            
            let attributedText = NSMutableAttributedString(string: "\n\n\n\(unwrappedPage.headerText)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Description elements
    
   private let bearImageView:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_image"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private  var imageTopView:UIView  = {
        let topView = UIView()
        topView.backgroundColor = .white
        topView.translatesAutoresizingMaskIntoConstraints = false
        return topView
    }()

    private   let descriptionTextView:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false // off scroll
        textView.isEditable = false // off editing text
        textView.backgroundColor = .white
        return textView
    }()
    
    
    // layout elements
    
    private func setupLayout() {
           
        self.addSubview(imageTopView)
        self.addSubview(bearImageView)
        self.addSubview(descriptionTextView)
        
        
        imageTopView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        imageTopView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageTopView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageTopView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        
        bearImageView.centerXAnchor.constraint(equalTo: imageTopView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: imageTopView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: imageTopView.heightAnchor, multiplier: 0.5).isActive = true

//        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
           // bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
            
        descriptionTextView.topAnchor.constraint(equalTo: imageTopView.bottomAnchor, constant: 20).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
 
    }
}

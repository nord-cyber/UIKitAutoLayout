//
//  ViewController.swift
//  BearImageView
//
//  Created by Vadzim Ivanchanka on 26.01.21.
//

//import UIKit
//
//extension UIColor {
//    static var pinkColor = UIColor(red: 249/255, green: 98/255, blue: 188/255, alpha: 1)
//    static var pinkColorLight = UIColor(red: 200/255, green: 130/255, blue: 200/255, alpha: 0.8)
//}
//
//
//
//class ViewController: UIViewController {
//
//    let bearImageView:UIImageView = {
//        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_image"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//
//
//    let descriptionTextView:UITextView = {
//        let textView = UITextView()
//        //textView.text = "Join to chat bear messenger"
//        textView.translatesAutoresizingMaskIntoConstraints = false
//
//
//        //  задаем настройки текста в текствью
//        let attributedText = NSMutableAttributedString(string: "Join to chat messenger", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
//
//        attributedText.append(NSAttributedString(string: "\n \n \n Here we have cool chat wit good people! Let's connect to us! Together we make this world is better!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
//
//        textView.attributedText = attributedText
//        textView.textAlignment = .center
//       // textView.font = UIFont.boldSystemFont(ofSize: 18)
//        textView.isScrollEnabled = false // off scroll
//        textView.isEditable = false // off editing text
//        textView.backgroundColor = .white
//        return textView
//    }()
//
//    var imageTopView:UIView  = {
//        let topView = UIView()
//        topView.backgroundColor = .white
//        topView.translatesAutoresizingMaskIntoConstraints = false
//        return topView
//    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.addSubview(descriptionTextView)
//        self.view.addSubview(imageTopView)
//        imageTopView.addSubview(bearImageView)
//        self.view.backgroundColor = .white
//        setupLayout()
//
//}
//
//
//
//
//    private func setupLayout() {
//
//        imageTopView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
//        imageTopView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        imageTopView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        imageTopView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//
//
//        bearImageView.centerXAnchor.constraint(equalTo: imageTopView.centerXAnchor).isActive = true
//        bearImageView.centerYAnchor.constraint(equalTo: imageTopView.centerYAnchor).isActive = true
//        bearImageView.heightAnchor.constraint(equalTo: imageTopView.heightAnchor, multiplier: 0.5).isActive = true
//
////        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//           // bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//
//
//        descriptionTextView.topAnchor.constraint(equalTo: imageTopView.bottomAnchor, constant: 20).isActive = true
//        descriptionTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 24).isActive = true
//        descriptionTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -24).isActive = true
//        descriptionTextView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
//    }
//
//
//}
//

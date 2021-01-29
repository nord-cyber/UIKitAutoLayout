//
//  Page.swift
//  BearImageView
//
//  Created by Vadzim Ivanchanka on 28.01.21.
//

import UIKit


struct Page {
    let imageName:String
    let headerText:String
    let bodyText:String
    
    
    
    static var pages:[Page] = [Page(imageName: "bear_image", headerText: "Joint to us chat!", bodyText: "Here we have fun communication and games!"),
                                        Page(imageName: "bear_image", headerText: "Use this chance!", bodyText: "When you click on this button you deep in crazy world!"),
                                        Page(imageName: "bear_image", headerText: "Do it!", bodyText: "You always cancel all changes in your card!"),
                                        Page(imageName: "bear_image", headerText: "Joint to us chat!", bodyText: "Here we have fun communication and games!"),
                                        Page(imageName: "bear_image", headerText: "Use this chance!", bodyText: "When you click on this button you deep in crazy world!"),
                                        Page(imageName: "bear_image", headerText: "Do it!", bodyText: "You always cancel all changes in your card!")]
}

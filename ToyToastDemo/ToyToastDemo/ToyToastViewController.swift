//
//  ToyToastViewController.swift
//  ToyToast
//
//  Created by Tachibana Kaoru on 4/11/15.
//  Copyright (c) 2015 Toyship.org. All rights reserved.
//

import Foundation
import UIKit

enum ColorStyle{
    
    case DarkGray
    case LightGray
    case White
    
    var basecolor : UIColor {
        
        switch self{
        case .DarkGray:
            return UIColor.darkGray
        case .LightGray:
            return UIColor.lightGray
        case .White:
            return UIColor.white
        }
        
    }
    
    var textcolor : UIColor {
        
        switch self{
        case .DarkGray:
            return UIColor.white
        case .LightGray:
            return UIColor.white
        case .White:
            return UIColor.darkGray
        }

    }
}

/**
ToyToast
Simple Toast Dialog
*/
@available(iOS, introduced: 7.0)
class ToyToastViewController : UIViewController{
    
    // MARK: - properties
    
    /// time until hiding toast (in seconds)
    var showtime : Double = 1.0
    /// color of toast and text. see ColorStyle enum
    var colorstyle : ColorStyle = ColorStyle.DarkGray
    /// transitionStyle in showing toast. default is CrossDissolve
    var transitionStyle : UIModalTransitionStyle = UIModalTransitionStyle.crossDissolve
    
    // MARK: - private properties

    private var isOS7 : Bool = false

    // MARK: - UI Parts
    var baseview : UIView!
    
    // MARK: - init
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
       
        super.init(nibName: nil, bundle: nil)

    }
    
    convenience init(title: String? ,message: String?,style: ColorStyle?){

        self.init(nibName:nil, bundle: nil)
        
        colorstyle = style!
        
        setStyle()
        buildBaseView()


        if let title = title, title.count > 0 {

            let textrect : CGRect = baseview.bounds.insetBy(dx: 10.0, dy: 10.0)

            let textrects : (CGRect,CGRect) = textrect.divided(atDistance: 17.0, from: .minYEdge)
            let titlerect = textrects.0
            let messagerect = textrects.1
            
            // titlelabel
            let titlelabel : UILabel = UILabel(frame: titlerect)
            titlelabel.text = title
            titlelabel.font = UIFont.systemFont(ofSize: 15.0)
            titlelabel.textAlignment = .center
            titlelabel.textColor = colorstyle.textcolor
            baseview.addSubview(titlelabel)
            
            // messagelabel
            let messagelabel : UILabel = UILabel(frame: messagerect)
            messagelabel.text = message!
            messagelabel.font = UIFont.systemFont(ofSize: 12.0)
            messagelabel.numberOfLines = 0
            messagelabel.textColor = colorstyle.textcolor
            baseview.addSubview(messagelabel)
            
        }
        else{

            let textrect : CGRect = baseview.bounds.insetBy(dx: 10.0, dy: 10.0)
            let messagerect = textrect
            
            // messagelabel
            let messagelabel : UILabel = UILabel(frame: messagerect)
            messagelabel.text = message!
            messagelabel.font = UIFont.systemFont(ofSize: 12.0)
            messagelabel.numberOfLines = 0
            messagelabel.textColor = colorstyle.textcolor
            baseview.addSubview(messagelabel)

        }
        
    }
    
    // MARK: - internal functions
    
    private func setStyle() -> Void{
        
        modalTransitionStyle = transitionStyle

        if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
            
            self.modalPresentationStyle = .currentContext
            
        }
        else{
            
            self.modalPresentationStyle = .overFullScreen
            
        }
    }
    
    private func buildBaseView() -> Void{
        
        let mainrect = UIScreen.main.bounds
        self.view.backgroundColor = UIColor.clear
        
        let leftmargin : CGFloat = 0.15
        let topmargin : CGFloat = 0.4

        let newRect = CGRect(x: mainrect.size.width * leftmargin, y: mainrect.size.height * topmargin, width: mainrect.size.width * (1.0 - leftmargin * 2), height: mainrect.size.height * (1.0 - topmargin * 2))
        baseview = UIView(frame: newRect)
        baseview.backgroundColor = colorstyle.basecolor
        
        baseview.layer.cornerRadius = 5;

        self.view.addSubview(baseview)
        
    }
    
    // MARK: - hide dialog in viewDidAppear
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5,
            
            delay: showtime,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 1.0,
            options: [UIViewAnimationOptions.curveEaseInOut],
            animations: {() -> Void in
                
                if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
                    
                }
                else{
                    
                    self.view.alpha = 0.0
                    
                }
                
            },
            completion:{ (Bool) -> Void in
                
                self.dismiss(animated: false, completion: nil)
                
            }
        )
    }
}

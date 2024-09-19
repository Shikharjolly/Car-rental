//
//  ViewController.swift
//  HummingBird Car Rental
//
//  Created by Ramatoulaye Kebe on 4/5/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placetopickupbtc: UIButton!
    
    @IBOutlet var citybtncollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        placetopickupbtc.layer.cornerRadius=placetopickupbtc.frame.height / 2
        citybtncollection.forEach { (btn) in
            btn.layer.cornerRadius = btn.frame.height / 2
            btn.isHidden=true
            btn.alpha = 0
            
        }
    }
  
    @IBAction func placetopickuppressed(sender: UIButton) {
        citybtncollection.forEach { (btn) in
            UIView.animate(withDuration: 0.7) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 : 0
                btn.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func pickupcitypressed(_ sender: UIButton) {
        if let btnlbl = sender.titleLabel?.text{print(btnlbl)}
    }
}


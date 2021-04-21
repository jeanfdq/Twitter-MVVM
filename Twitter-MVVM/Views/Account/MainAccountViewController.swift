//
//  MainAccountViewController.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import UIKit

class MainAccountViewController: UIViewController {

    // MARK: - Properties
    
    let loading = Loading()
    
    let logoTipo: UIImageView = {
        let image = UIImageView(image: Images.logoBlue)
        image.frame.size = image.setNewHeightWidth(newWidth: 45)
        return image
    }()
    
    
    let labelApp: UILabel = {
        let label = UILabel()
        label.text = L10nKeys.labelCentral.localized
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    lazy var createAccountBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Colors.mainColor
        btn.setCorner(radius: 21)
        btn.setShadow(radius: 2, opacity: 0.8)
        btn.setAttributedTitle(NSAttributedString(string: L10nKeys.createAccountBtnTitle.localized, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        btn.frame.size = .init(width: view.frame.size.width * 0.8, height: 42)
        return btn
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Have an account already?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)])
        attributedText.append(NSAttributedString(string: " Log In", attributes: [NSAttributedString.Key.foregroundColor : Colors.mainColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .semibold)]))
        label.attributedText = attributedText
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubViews(logoTipo, labelApp, createAccountBtn, bottomLabel)
        logoTipo.applyViewConstraints(top: view.safeAreaLayoutGuide.topAnchor, centerX: view.centerXAnchor, size: logoTipo.frame.size, value: .zero)
        labelApp.applyCenterIntoSuperView()
        createAccountBtn.applyViewConstraints(top: labelApp.bottomAnchor, centerX: labelApp.centerXAnchor, size: createAccountBtn.frame.size, value: .init(top: 20, left: 0, bottom: 0, right: 0))
        bottomLabel.applyViewConstraints(leading: createAccountBtn.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, value: .init(top: 0, left: 0, bottom: 20, right: 0))
    }

}

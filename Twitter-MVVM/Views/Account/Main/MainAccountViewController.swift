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
        let text = L10nKeys.createAccountBtnTitle.localized
        let fontValue = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setAttributedTitle(NSAttributedString(string: text, attributes: [.font: fontValue, .foregroundColor: UIColor.white]), for: .normal)
        btn.frame.size = .init(width: view.frame.size.width * 0.8, height: 42)
        btn.addTapGesture { [weak self] in
            self?.goToSignUp?()
        }
        return btn
    }()
    
    lazy var bottomLabel: UILabel = {
        let label = UILabel()
        let text = L10nKeys.haveAlreadyAccount.localized
        let text2 = L10nKeys.haveAlreadyAccountLogIn.localized
        let fontRegular = UIFont.systemFont(ofSize: 13, weight: .regular)
        let fontSemibold = UIFont.systemFont(ofSize: 13, weight: .semibold)
        let attributedText = NSMutableAttributedString(string: text, attributes: [.foregroundColor: UIColor.darkGray, .font: fontRegular])
        attributedText.append(NSAttributedString(string: text2, attributes: [.foregroundColor: Colors.mainColor, .font: fontSemibold]))
        label.attributedText = attributedText
        label.isUserInteractionEnabled = true
        label.addTapGesture { [weak self] in
            self?.goToLogin?()
        }
        return label
    }()
    
    // MARK: - Rerverse Inject Closure
    
    var goToLogin: (() -> Void)?
    var goToSignUp: (() -> Void)?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubViews(logoTipo, labelApp, createAccountBtn, bottomLabel)
        logoTipo.applyViewConstraints(top: view.safeAreaLayoutGuide.topAnchor, centerX: view.centerXAnchor, size: logoTipo.frame.size)
        labelApp.applyCenterIntoSuperView()
        createAccountBtn.applyViewConstraints(top: labelApp.bottomAnchor, centerX: labelApp.centerXAnchor, size: createAccountBtn.frame.size, constants: [.top(20)])
        bottomLabel.applyViewConstraints(leading: createAccountBtn.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, constants: [.bottom(20)])
        
    }

}

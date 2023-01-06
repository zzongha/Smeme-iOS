//
//  MyDiaryNavigationBar.swift
//  Smeme-iOS
//
//  Created by 임주민 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

final class MyDiaryNavigationBar: UIView {
    
    // MARK: - Property
    
    var goMyProfileView: (() -> Void)?
    
    override var intrinsicContentSize: CGSize {
        let heightStatusBar = constraintByNotch(44, 10)
        return CGSize(width: UIScreen.main.bounds.width, height: 66 + heightStatusBar)
    }
    
    // MARK: - UI Property
    
    private let logoImage = UIImageView().then {
        $0.image = Constant.Image.logoSmeme
    }
    
    private lazy var profileButton = UIButton().then {
        $0.setImage(Constant.Image.icnProfile, for: .normal)
        $0.addTarget(self, action: #selector(touchProfileButton(_:)), for: .touchUpInside)
    }
    
    // MARK: - @objc
    
    @objc func touchProfileButton(_ sender: UIButton) {
        goMyProfileView?()
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        backgroundColor = .white
    }
    
    private func setLayout() {
        addSubviews( [logoImage, profileButton] )
        
        let topPadding = constraintByNotch(44, 10)
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23 + topPadding)
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(21)
            $0.width.equalTo(98)
        }
        
        profileButton.snp.makeConstraints {
            $0.centerY.equalTo(self.logoImage)
            $0.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(40)
            $0.width.equalTo(40)
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        setLayout()
        invalidateIntrinsicContentSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

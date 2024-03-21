//
//  SeparatorLine.swift
//  Beneficiaries
//
//  Created by Dan Pham on 3/15/24.
//

import UIKit

class SeparatorLine: UIView {
    
    var separatorLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(separatorLine)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.backgroundColor = .tertiaryLabel
        
        NSLayoutConstraint.activate([
            separatorLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorLine.topAnchor.constraint(equalTo: topAnchor),
            separatorLine.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

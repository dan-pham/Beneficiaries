//
//  DetailCell.swift
//  Beneficiaries
//
//  Created by Dan Pham on 3/15/24.
//

import UIKit

class DetailCell: UIView {
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        setLabelConstraints()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.textAlignment = .right
        descriptionLabel.numberOfLines = 0
    }
    
    private func setLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -4),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
}

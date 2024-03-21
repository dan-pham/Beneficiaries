//
//  BeneficiaryCell.swift
//  Beneficiaries
//
//  Created by Dan Pham on 3/15/24.
//

import UIKit


class BeneficiaryCell: UITableViewCell {
    
    var descriptionLabel = UILabel()
    var nameLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        
        addSubview(descriptionLabel)
        addSubview(nameLabel)
        
        nameLabel.textColor = .secondaryLabel
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -4),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 4)
        ])
    }
    
}

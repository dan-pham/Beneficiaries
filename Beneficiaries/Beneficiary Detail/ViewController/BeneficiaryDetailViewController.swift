//
//  BeneficiaryDetailViewController.swift
//  Beneficiaries
//
//  Created by Dan Pham on 3/15/24.
//

import UIKit

class BeneficiaryDetailViewController: UIViewController {
    
    var viewModel: BeneficiaryDetailViewModel!
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var nameView = DetailCell(frame: .zero)
    var designationView = DetailCell(frame: .zero)
    var beneTypeView = DetailCell(frame: .zero)
    var socialSecurityNumberView = DetailCell(frame: .zero)
    var dateOfBirthView = DetailCell(frame: .zero)
    var phoneNumberView = DetailCell(frame: .zero)
    var addressView = DetailCell(frame: .zero)
    
    
    init(beneficiary: Beneficiary) {
        super.init(nibName: nil, bundle: nil)
        viewModel = BeneficiaryDetailViewModel(beneficiary: beneficiary)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureScrollView()
        configureViews()
        setData()
    }
    
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        let layoutGuide = scrollView.superview!.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func configureViews() {
        setConstraints(for: nameView, aboveView: view, isTop: true)
        setConstraints(for: designationView, aboveView: nameView)
        setConstraints(for: beneTypeView, aboveView: designationView)
        setConstraints(for: socialSecurityNumberView, aboveView: beneTypeView)
        setConstraints(for: dateOfBirthView, aboveView: socialSecurityNumberView)
        setConstraints(for: phoneNumberView, aboveView: dateOfBirthView)
        setConstraints(for: addressView, aboveView: phoneNumberView, isBottom: true)
    }
    
    private func setConstraints(for myView: UIView, aboveView: UIView, isTop: Bool = false, isBottom: Bool = false) {
        let topAnchor = isTop ? contentView.topAnchor : aboveView.bottomAnchor
        let oneLineHeight: CGFloat = 44
        let threeLineHeight: CGFloat = oneLineHeight * 3
        
        contentView.addSubview(myView)
        
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: topAnchor),
            myView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myView.heightAnchor.constraint(equalToConstant: isBottom ? threeLineHeight : oneLineHeight)
        ])
        
        addSeparatorLine(to: myView)
    }
    
    private func addSeparatorLine(to aboveView: UIView) {
        let separatorLine = SeparatorLine(frame: .zero)
        contentView.addSubview(separatorLine)
        
        NSLayoutConstraint.activate([
            separatorLine.topAnchor.constraint(equalTo: aboveView.bottomAnchor),
            separatorLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            separatorLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            separatorLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setData() {
        set(nameView, withTitle: "Name", description: viewModel.name)
        set(designationView, withTitle: "Designation", description: viewModel.designation)
        set(beneTypeView, withTitle: "Beneficiary Type", description: viewModel.beneType)
        set(socialSecurityNumberView, withTitle: "Social Security", description: viewModel.socialSecurityNumber)
        set(dateOfBirthView, withTitle: "Date of Birth", description: viewModel.dateOfBirth)
        set(phoneNumberView, withTitle: "Phone Number", description: viewModel.phoneNumber)
        set(addressView, withTitle: "Address", description: viewModel.address)
    }
    
    
    private func set(_ cell: DetailCell, withTitle title: String, description: String ) {
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
    }
}

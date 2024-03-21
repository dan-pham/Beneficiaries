//
//  BeneficiariesViewController.swift
//  Beneficiaries
//
//  Created by Dan Pham on 3/14/24.
//

import Combine
import UIKit


class BeneficiariesViewController: UIViewController {

    var viewModel = BeneficiariesViewModel()
    var cancellables = Set<AnyCancellable>()
    
    var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Beneficiaries"
        view.backgroundColor = .systemBackground
        
        configureTableView()
        bindViewModel()
        
        let url = Bundle.main.url(forResource: "Beneficiaries", withExtension: "json")
        viewModel.fetchBeneficiaries(from: url)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        setTableViewConstraints()
        removeFirstSeparator()
        registerTableViewCell()
        setTableViewRowHeight()
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func removeFirstSeparator() {
        tableView.tableHeaderView = UIView()
    }
    
    private func registerTableViewCell() {
        tableView.register(BeneficiaryCell.self, forCellReuseIdentifier: viewModel.cellReuseIdentifier)
    }
    
    private func setTableViewRowHeight() {
        tableView.rowHeight = viewModel.oneLineHeight * 1.5
    }
    
    private func bindViewModel() {
        viewModel.$beneficiaries
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.$errorMessage
            .compactMap { $0 }
            .sink { [weak self] errorMessage in
                self?.presentAlert(withMessage: errorMessage)
            }
            .store(in: &cancellables)
    }
    
    private func presentAlert(withMessage message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true, completion: nil)
    }
}

extension BeneficiariesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfBeneficiaries
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellReuseIdentifier) as! BeneficiaryCell
        
        guard let beneficiary = viewModel.beneficiary(at: indexPath.row) else { return UITableViewCell() }
        
        cell.descriptionLabel.text = "\(beneficiary.designationCode == .P ? "Primary" : "Contingent"): \(beneficiary.beneType)"
        cell.nameLabel.text = "\(beneficiary.firstName) \(beneficiary.lastName)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beneficiary = viewModel.beneficiaries[indexPath.row]
        let viewController = BeneficiaryDetailViewController(beneficiary: beneficiary)
        
        navigationController?.pushViewController(viewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


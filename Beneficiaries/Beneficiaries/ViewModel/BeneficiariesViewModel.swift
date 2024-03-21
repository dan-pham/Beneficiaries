//
//  BeneficiariesViewModel.swift
//  Beneficiaries
//
//  Created by Dan Pham on 3/15/24.
//

import Combine
import UIKit


class BeneficiariesViewModel {
    
    let cellReuseIdentifier = "BeneficiaryCell"
    let oneLineHeight: CGFloat = 44
    
    @Published var beneficiaries: [Beneficiary] = []
    @Published var errorMessage: String? = nil
    
    var numberOfBeneficiaries: Int {
        return beneficiaries.count
    }
    
    func beneficiary(at index: Int) -> Beneficiary? {
        guard index < numberOfBeneficiaries else { return nil }
        return beneficiaries[index]
    }
    
    func fetchBeneficiaries(from url: URL?) {
        decodeJSON(from: url) { [weak self] result in
            switch result {
            case .success(let beneficiaries):
                self?.beneficiaries = beneficiaries
                
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                print(error.localizedDescription)
            }
        }
    }
    
    private func decodeJSON(from url: URL?, completion: @escaping (Result<[Beneficiary], Error>) -> Void) {
        guard let url = url else {
            let error = NSError(domain: "Couldn't find the url", code: 0)
            completion(.failure(error))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode([Beneficiary].self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
}

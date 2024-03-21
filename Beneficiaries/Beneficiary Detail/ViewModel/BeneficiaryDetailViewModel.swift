//
//  BeneficiaryDetailViewModel.swift
//  Beneficiaries
//
//  Created by Dan Pham on 3/15/24.
//

import UIKit

class BeneficiaryDetailViewModel {
    
    let beneficiary: Beneficiary
    
    var name: String {
        let middleName = beneficiary.middleName.isEmpty ? "" : " \(beneficiary.middleName). "
        return beneficiary.firstName + middleName + beneficiary.lastName
    }
    
    var designation: String {
        return beneficiary.designationCode == .P ? "Primary" : "Contingent"
    }
    
    var beneType: String {
        return beneficiary.beneType
    }
    
    var socialSecurityNumber: String {
        return beneficiary.socialSecurityNumber
    }
    
    var dateOfBirth: String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "MMddyyyy"
        
        guard let date = inputDateFormatter.date(from: beneficiary.dateOfBirth) else { return "" }
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "MMM d, yyy"
        return outputDateFormatter.string(from: date)
    }
    
    var phoneNumber: String {
        let phoneNumber = beneficiary.phoneNumber
        let areaCode = phoneNumber.dropLast(7)
        let firstChunk = phoneNumber.dropFirst(3).dropLast(4)
        let secondChunk = phoneNumber.dropFirst(6)
        
        return "(\(areaCode)) \(firstChunk)-\(secondChunk)"
    }
    
    var address: String {
        let address = beneficiary.beneficiaryAddress
        let streetAddress = address.firstLineMailing
        let remainingAddress = "\(address.city), \(address.stateCode) \(address.zipCode)"
        let country = address.country
        return "\(streetAddress)\n\(remainingAddress)\n\(country)"
    }
    
    init(beneficiary: Beneficiary) {
        self.beneficiary = beneficiary
    }
    
}

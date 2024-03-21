//
//  Beneficiary.swift
//  Beneficiaries
//
//  Created by Dan Pham on 3/14/24.
//

import Foundation

struct Beneficiary: Codable {
    enum DesignationCode: String, Codable {
        case P, C
    }
    
    let lastName: String
    let firstName: String
    let designationCode: DesignationCode
    let beneType: String
    let socialSecurityNumber: String
    let dateOfBirth: String
    let middleName: String
    let phoneNumber: String
    let beneficiaryAddress: Address
}

struct Address: Codable {
    let firstLineMailing: String
    let scndLineMailing: String?
    let city: String
    let zipCode: String
    let stateCode: String
    let country: String
}

extension Beneficiary: Equatable {
    static func == (lhs: Beneficiary, rhs: Beneficiary) -> Bool {
        lhs.socialSecurityNumber == rhs.socialSecurityNumber
    }
}

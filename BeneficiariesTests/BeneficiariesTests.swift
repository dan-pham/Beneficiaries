//
//  BeneficiariesTests.swift
//  BeneficiariesTests
//
//  Created by Dan Pham on 3/15/24.
//

import XCTest
@testable import Beneficiaries

final class BeneficiariesTests: XCTestCase {

    var viewModel: BeneficiariesViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = BeneficiariesViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func test_init_noBeneficiariesLoaded() {
        XCTAssertEqual(viewModel.numberOfBeneficiaries, 0)
    }
    
    func test_load_beneficiariesLoaded() {
        viewModel.beneficiaries = [aBeneficiary()]
        XCTAssertEqual(viewModel.numberOfBeneficiaries, 1)
        
        viewModel.beneficiaries = [aBeneficiary(), aBeneficiary()]
        XCTAssertEqual(viewModel.numberOfBeneficiaries, 2)
    }
    
    func test_init_noBeneficiaryAtIndexZero() {
        XCTAssertNil(viewModel.beneficiary(at: 0))
    }
    
    func test_load_beneficiaryAtIndexesZeroAndOne() {
        let beneficiary1 = aBeneficiary()
        let beneficiary2 = anotherBeneficiary()
        
        viewModel.beneficiaries = [beneficiary1, beneficiary2]
        XCTAssertEqual(viewModel.beneficiary(at: 0), beneficiary1)
        XCTAssertEqual(viewModel.beneficiary(at: 1), beneficiary2)
    }
    
    func test_load_fetchBeneficiariesSucceeded() {
        let url = Bundle.main.url(forResource: "Beneficiaries", withExtension: "json")
        viewModel.fetchBeneficiaries(from: url)
        
        XCTAssertNotEqual(viewModel.numberOfBeneficiaries, 0)
    }
    
    func test_load_fetchBeneficiariesFailed() {
        let badUrl = Bundle.main.url(forResource: "BadURL", withExtension: "json")
        viewModel.fetchBeneficiaries(from: badUrl)
        
        XCTAssertNotEqual(viewModel.errorMessage, nil)
    }
    
    
    // MARK: - Helpers
    
    func aBeneficiary() -> Beneficiary {
        let address = Address(firstLineMailing: "8515 E Orchard Rd", scndLineMailing: nil, city: "Greenwood Village", zipCode: "80111", stateCode: "CO", country: "US")
        let beneficiary = Beneficiary(lastName: "Smith", firstName: "John", designationCode: .P, beneType: "Spouse", socialSecurityNumber: "XXXXX3333", dateOfBirth: "04201979", middleName: "D", phoneNumber: "3035555555", beneficiaryAddress: address)
        return beneficiary
    }
    
    func anotherBeneficiary() -> Beneficiary {
        let address = Address(firstLineMailing: "8515 E Orchard Rd", scndLineMailing: nil, city: "Greenwood Village", zipCode: "80111", stateCode: "CO", country: "US")
        let beneficiary = Beneficiary(lastName: "Smith", firstName: "John", designationCode: .P, beneType: "Spouse", socialSecurityNumber: "XXXXX4664", dateOfBirth: "04201979", middleName: "D", phoneNumber: "3035555555", beneficiaryAddress: address)
        return beneficiary
    }

}

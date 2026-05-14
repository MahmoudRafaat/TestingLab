//
//  testEmployee.swift
//  TestingLabTests
//
//  Created by Mahmoud  Raafat  on 12/05/2026.
//

import XCTest
@testable import TestingLab

final class EmployeeTests: XCTestCase {
    
    var emp: Employee?

    override func setUp() {
        emp = Employee(name: "mahmoud")
    }

 
 // nill gross salary
    func testCalcNetSalary_nillSalary_Fails() {
        emp?.grossSalary = nil
        emp?.calcNetSalary()

//        if emp?.grossSalary == nil {
//            XCTFail("Gross salary nill")
//        }
        XCTAssertNil(emp?.grossSalary)
    }
// for gross salary 10000 so annual will be greater than min
    func testAnnualSalary_forGrossSalary_greaterthanminum() {
        emp?.grossSalary = 10000
        emp?.calcNetSalary()
        
        let annual = emp?.annualNetSalary ?? 0
        let min = emp?.minAnnualNetSalary ?? 0
        XCTAssertGreaterThan(annual, min)
    }
// for gross salary 6000 so annull will be less than max
    func testAnnualSalary_forGrossSalary_greaterthanmax() {
        emp?.grossSalary = 6000
        emp?.calcNetSalary()
        
        let annual = emp?.annualNetSalary ?? 0
        let max = emp?.maxAnnualNetSalary ?? 150000
        XCTAssertLessThan(annual, max)
    }

    func testDeductionPercentage_For5000() {
        emp?.grossSalary = 5000
        emp?.calcNetSalary()
        
        XCTAssertEqual(emp?.deductionsPersentage, 5.0)
    }
    
//    func testEmployeeInstance_IsCreated() {
//        XCTAssertNotNil(emp)
//    }
}

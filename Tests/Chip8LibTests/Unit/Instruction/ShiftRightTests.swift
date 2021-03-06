import XCTest
@testable import Chip8Lib

final class ShiftRightTests: XCTestCase {
    
    func testShfitsWith0LSB() throws {
        let interp = mockInterpreter(v0: 0b100, v1: 100)
        
        interp.run(instruction: .shiftRight(.v0))
        
        XCTAssertEqual(interp[.v0], 0b010)
        XCTAssertEqual(interp[.v1], 100) // Tests current spec doesn't modify vy
        XCTAssertEqual(interp[.vf], 0)
    }
    
    func testShiftsWith1LSB() throws {
        let interp = mockInterpreter(v0: 0b101, v1: 100)
        
        interp.run(instruction: .shiftRight(.v0))
        
        XCTAssertEqual(interp[.v0], 0b010)
        XCTAssertEqual(interp[.v1], 100) // Tests current spec doesn't modify vy
        XCTAssertEqual(interp[.vf], 1)
    }
    
    func testParse() {
        XCTAssertEqual(Instruction(rawValue: 0x8006), .shiftRight(.v0))
    }
}

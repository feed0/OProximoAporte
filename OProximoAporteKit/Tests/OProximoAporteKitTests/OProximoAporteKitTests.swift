import Testing
@testable import OProximoAporteKit

@Suite("Package Setup")
struct PackageSetupTests {
    
    @Test("Package compiles and is testable")
    func packageIsWired() {
        #expect(1 + 1 == 2)
    }
}

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(html5dicomswiftTests.allTests),
    ]
}
#endif

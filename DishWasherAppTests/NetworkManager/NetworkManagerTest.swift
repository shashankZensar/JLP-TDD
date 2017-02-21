//
//  NetworkManagerTest.swift
//  DishWasherApp
//
//  Created by Shashank Dekate on 21/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import XCTest
@testable import DishWasherApp

class NetworkManagerTest: XCTestCase {
    
    var sut:NetWorkManager!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = NetWorkManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Login_UsesExpectedURL() {
        
        
        
        let mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        sut.session = mockURLSession
        
        sut.getDataFromServer(strUrl: "https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20") { (dic, error) in
            
        }
        
        
        guard let url = mockURLSession.url else { XCTFail(); return }
        let urlComponents = URLComponents(url: url,
                                          resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.host, "api.johnlewis.com")
        
        XCTAssertEqual(urlComponents?.path, "/v1/products/search")
        
        XCTAssertEqual(urlComponents?.query,
                       "q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20")
    }
    
    func test_getDataFromServer_WhenSuccessful_CreatesDic(){
        
        
        let dic = ["product":[["dishwash1":"dish1"],["dishwash1":"dish2"]]]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            
            let mockURLSession = MockURLSession(data: jsonData,
                                                urlResponse: nil,
                                                error: nil)
            sut.session = mockURLSession
            
            
            let tokenExpectation = expectation(description: "Token")
            var catchedToken: [String:AnyObject]? = nil
            sut.getDataFromServer(strUrl: "https://www.google.com", completion: { (dic, error) in
                catchedToken = dic
                tokenExpectation.fulfill()
            })
            
            
            waitForExpectations(timeout: 3) { (error) in
                
                let arrOFProducts = catchedToken?["product"] as! NSArray
                
                var dicOfProduct = arrOFProducts[0] as! [String:String]
                
                print(dicOfProduct["dishwash1"]!)
                
                XCTAssertEqual(dicOfProduct["dishwash1"]!,"dish1")
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
    
    }

    
    func test_getDataFromServer_WhenJSONIsInvalid_ReturnsError() {
        
        
        let mockURLSession = MockURLSession(data: Data(),
                                            urlResponse: nil,
                                            error: nil)
        sut.session = mockURLSession
        
        
        let errorExpectation = expectation(description: "Error")
        var catchedError: Error? = nil
        
        
        sut.getDataFromServer(strUrl: "https://www.google.com") { (dic , error) in
            catchedError = error
            errorExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(catchedError)
        }
    }
    
    func test_getDataFromServer_WhenDataIsNil_ReturnsError() {
        
        
        let mockURLSession = MockURLSession(data: nil,
                                            urlResponse: nil,
                                            error: nil)
        sut.session = mockURLSession
        
        
        let errorExpectation = expectation(description: "Error")
        var catchedError: Error? = nil
        
        
        sut.getDataFromServer(strUrl: "https://www.google.com") { (dic , error) in
            catchedError = error
            errorExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(catchedError)
        }
    }
    
    func test_getDataFromServer_WhenResponseHasError_ReturnsError() {
        
        
        let error = NSError(domain: "SomeError",
                            code: 1234,
                            userInfo: nil)
        let dic = ["token": "1234567890"]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            let mockURLSession = MockURLSession(data: jsonData,
                                                urlResponse: nil,
                                                error: error)
            sut.session = mockURLSession
            
            
            let errorExpectation = expectation(description: "Error")
            var catchedError: Error? = nil
            
            
            sut.getDataFromServer(strUrl: "https://www.google.com") { (dic , error) in
                catchedError = error
                errorExpectation.fulfill()
            }
            
            waitForExpectations(timeout: 1) { (error) in
                XCTAssertNotNil(catchedError)
            }
            
        }catch {
            print(error.localizedDescription)
        }
        
    }
    

}

extension NetworkManagerTest{
    
    class MockURLSession: SessionProtocol {
        
        var url: URL?
        
        private let dataTask: MockTask
        
        
        init(data: Data?, urlResponse: URLResponse?, error: Error?) {
            dataTask = MockTask(data: data,
                                urlResponse: urlResponse,
                                error: error)
        }
        
        func dataTask(
            with url: URL,
            completionHandler: @escaping
            (Data?, URLResponse?, Error?) -> Void)
            -> URLSessionDataTask {
                
                self.url = url
                
                dataTask.completionHandler = completionHandler
                return dataTask
        }
    }
    
    
    class MockTask: URLSessionDataTask {
        private let data: Data?
        private let urlResponse: URLResponse?
        private let responseError: Error?
        
        
        typealias CompletionHandler = (Data?, URLResponse?, Error?)
            -> Void
        var completionHandler: CompletionHandler?
        
        
        init(data: Data?, urlResponse: URLResponse?, error: Error?) {
            self.data = data
            self.urlResponse = urlResponse
            self.responseError = error
        }
        
        
        override func resume() {
            DispatchQueue.main.async() {
                self.completionHandler?(self.data,
                                        self.urlResponse,
                                        self.responseError)
            }
        }
    }


}

import Foundation
import Alamofire
import UIKit

protocol HTTPClientProvider {
    func get(url : String, params : Parameters?, header : HTTPHeaders) -> DataRequest
    func post(url : String, params : Parameters?, header : HTTPHeaders) -> DataRequest
    func delete(url : String, params : Parameters?, header : HTTPHeaders) -> DataRequest
}

class HTTPClient: HTTPClientProvider {
    let baseURL = "https://ptsv2.com"
    
    func get(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: header,
                          interceptor: nil)
    }
    
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .post,
                          parameters: params,
                          encoding: JSONEncoding.prettyPrinted,
                          headers: header,
                          interceptor: nil)
    }
    
    func delete(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .delete,
                          parameters: params,
                          encoding: JSONEncoding.prettyPrinted,
                          headers: header,
                          interceptor: nil)
    }
}

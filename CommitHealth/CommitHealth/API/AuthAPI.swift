import Foundation

enum AuthAPI: API {
    case signUp
    
    func path() -> String {
        switch self {
        case .signUp:
            return "/user/sign-up"
        }
    }
}


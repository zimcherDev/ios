import Foundation

struct Validation {
    //email
    static let EMAIL_USE_STRICT_FILTER = false
    private static let EMAIL_STRICTER_FILTER_STRING = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
    private static let EMAIL_LAX_STRING = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
    static let EMAIL_FILTER = EMAIL_USE_STRICT_FILTER ? EMAIL_STRICTER_FILTER_STRING : EMAIL_LAX_STRING
    
    //user name
    static let USER_NAME_ALLOWED_CHARS = "^[A-Za-z0-9_ ]*$"
}
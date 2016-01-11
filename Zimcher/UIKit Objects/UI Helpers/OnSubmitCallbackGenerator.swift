import UIKit
struct OnSubmitCallbackGenerator {
    static func textFieldValidation(validator: IsValid.TextValidatorType) -> OnSubmitCallbackType
    {
        return { c in
            let control = c as! UITextField
            return IsValid.hasValidInput(control.text, validator: validator)
        }
    }
    
    static func textValidateAndAlert(validator: IsValid.TextValidatorType,  onFail: () -> Void) -> OnSubmitCallbackType
    {
        return { c in
            let f = textFieldValidation(validator)
            if f(c) { return true }
            onFail()
            return false
        }
    }
    
}
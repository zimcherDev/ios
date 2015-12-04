import UIKit
struct OnSubmitCallbackGenerator {
    static func TextFieldValidation(validator: IsValid.TextValidatorType) -> OnSubmitCallbackType
    {
        return { c in
            let control = c as! UITextField
            return IsValid.hasValidInput(control.text, validator: validator)
        }
    }
}

protocol ValidationAndTopAlertView: TopAlertViewContainer
{
    func validate(input: [Validatable])-> Bool
}

extension ValidationAndTopAlertView {
    
    //primary interface
    func validate(input: [Validatable])-> Bool
    {
        if let errorMsg = input.filter({ i in !IsValid.hasValidInput(i.validatee, validator: i.validator) }).first?.invalidMessage {
            showTopAlert(errorMsg)
            return false
        }
        return true
    }
    
}
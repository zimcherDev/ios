import Foundation

extension Networking {
    static func headersToString(headers: [String: String]) -> String
    {
        var headerString = ""
        for (k, v) in headers {
            headerString += "\(k): \(v)\(Networking.CRLF)"
        }
        headerString += Networking.CRLF
        
        return headerString
    }   
}

// MARK: Input Datatypes For multipart/form-data
protocol FormValueDataType
{
    var size: UInt64 {get}
}

protocol MIMETypedData
{
    var MIMEType: String {get}
}

protocol FileTypeData: MIMETypedData
{
    var unescapedName: String {get}
    var fileURL: NSURL {get}
}

// Doesn't have acutal data in it
struct File: FormValueDataType, FileTypeData{
    let unescapedName: String
    let size: UInt64
    let MIMEType: String
    let fileURL: NSURL
    
    init?(nullableFileURL: NSURL?)
    {
        guard let fileURL = nullableFileURL else {
            unescapedName = ""
            size = 0
            MIMEType = mimeTypeForPathExtension(unescapedName)
            self.fileURL = NSURL()
            return
        }
        guard fileURL.fileURL else { return nil }
        
        guard let name = fileURL.lastPathComponent else { return nil }
        
        self.fileURL = fileURL
        unescapedName = name
        MIMEType = mimeTypeForPathExtension(unescapedName)
       
        var num :AnyObject? = nil
        guard let _ = try? fileURL.getResourceValue(&num, forKey: NSURLFileSizeKey) else { return nil }
        
        size = UInt64((num as? NSNumber)?.integerValue ?? 0)
    }
}

extension String: FormValueDataType{
    var size: UInt64 {
        return UInt64(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
    }
}

struct Multipart {
    static let boundaryString = "LONGLIVELONGQUADYNASTY"
    static let startingBoundary = "--\(boundaryString)\(Networking.CRLF)"
    static let encapBoundary = "\(Networking.CRLF)--\(boundaryString)\(Networking.CRLF)"
    static let endingBoundary = "\(Networking.CRLF)--\(boundaryString)--\(Networking.CRLF)"
    
    var contentLength: UInt64 {
        let s =  bodyParts.reduce(UInt64(0)) {sum, part in
            let boundarySize = (sum == 0 ? Multipart.startingBoundary : Multipart.encapBoundary).size
            return sum + part.value.size + Networking.headersToString(subHeaderForBodyPart(part.fieldName, bodypart: part.value)).size + boundarySize
        }
        return s + Multipart.endingBoundary.size
    }
    
    var bodyParts = [(fieldName: String, value: FormValueDataType)]()
    
    var headers:[String: String] {
        return ["content-type": "multipart/form-data; boundary=\(Multipart.boundaryString)", "content-length": String(contentLength)]
    }
    
    private func subHeaderForBodyPart(fieldName: String, bodypart: FormValueDataType) -> [String: String]
    {
        var subHeader = ["Content-Disposition": "form-data; name=\"\(fieldName)\""]
        if bodypart is MIMETypedData {
            subHeader["Content-Type"] = (bodypart as! MIMETypedData).MIMEType
        }
        if bodypart is FileTypeData {
            subHeader["Content-Disposition"]! += "; filename=\"\((bodypart as! FileTypeData).unescapedName)\""
        }
        return subHeader
    }
    
    private func subHeaderData(pair: (String, FormValueDataType)) -> NSData
    {
        let s = Networking.headersToString(subHeaderForBodyPart(pair.0, bodypart: pair.1))
        return encodeString(s)
    }
    
    private func encodeString(s: String) -> NSData
    {
        return s.dataUsingEncoding(NSUTF8StringEncoding)!
        //no workaround if failed?
    }
    
    //MARK: Output
    // Smaller files use NSData. Time efficient
    // Data is stateless
    var data: NSData {
        let output = bodyParts.reduce(NSMutableData()) { accu, newVal in
            let boundary = accu.length > 0 ? Multipart.encapBoundary : Multipart.startingBoundary
            
            accu.appendData(encodeString(boundary))
            accu.appendData(subHeaderData(newVal))
            
            if let data = newVal.value as? FileTypeData{
                accu.appendData(NSData(contentsOfURL:data.fileURL)!)
            } else if let text = newVal.value as? String {
                accu.appendData(encodeString(text))
            }
            return accu
        }
        
        output.appendData(encodeString(Multipart.endingBoundary))
        return output
    }
    
    //streams have states
    func stream() -> MixedInputStream {
        var output = bodyParts.reduce(MixedInputStream()) {mixedStream, input in
            let boundary = mixedStream.streams.count > 0 ? Multipart.encapBoundary : Multipart.startingBoundary
            var s = mixedStream
            s += NSInputStream(data: encodeString(boundary))
            s += NSInputStream(data: subHeaderData(input))
            
            if let data = input.value as? FileTypeData, let stream = NSInputStream(URL: data.fileURL) {
                s += stream
            } else if let text = input.value as? String {
                s += NSInputStream(data: text.dataUsingEncoding(NSUTF8StringEncoding)!)
            }
            return s
        }
        
        output += NSInputStream(data: encodeString(Multipart.endingBoundary))
        return output
    }
    
    //MARK: Input
    mutating func appendField(fieldName: String, value: FormValueDataType)
    {
        bodyParts.append((fieldName: fieldName , value: value))
    }
    
    init(form: [String: FormValueDataType])
    {
        bodyParts = form.map { k, v in (fileName: k, value: v)}
    }
    
    init()
    {
    }

}


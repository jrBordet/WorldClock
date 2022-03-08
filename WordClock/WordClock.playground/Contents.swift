import UIKit
import Foundation

var greeting = "Hello, playground"


let d = Date(timeIntervalSince1970: 1646744400)//Date()

let calendar = Calendar.current

let result = calendar.dateComponents([.hour, .minute], from: d)

print(result)


dateComponents(from: d)

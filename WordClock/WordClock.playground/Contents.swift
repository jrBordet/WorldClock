import UIKit
import Foundation

var greeting = "Hello, playground"


let d = Date(timeIntervalSinceNow: 1646754302)//Date()

let calendar = Calendar.current

let result = calendar.dateComponents([.hour, .minute], from: d)

print(result)


dateComponents(from: d)

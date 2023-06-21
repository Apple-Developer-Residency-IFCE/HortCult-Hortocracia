import UIKit

let formatter = DateFormatter()
formatter.dateFormat = "dd/MM/yyyy"
let firstDate = formatter.date(from: "10/08/2017")
let secondDate = formatter.date(from: "10/08/2017")

print(firstDate == secondDate)

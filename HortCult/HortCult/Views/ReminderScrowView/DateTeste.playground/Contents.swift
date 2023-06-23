import UIKit
var formatedToday = Date()
let formatter = DateFormatter()
formatter.dateFormat = "MM/dd/yyyy"
formatedToday = formatter.date(from: String(formatedToday.formatted().prefix(9)))!
//
//datas = Calendar.current.date(byAdding: .day, value: 1, to: formatDate ?? Date())!
//print(type(of: formatDate))
//print(datas)
//


//let formatter = DateFormatter()
//formatter.dateFormat = "MM/dd/yyyy"
var nextDate: Date = Date()
nextDate = formatter.date(from: String(nextDate.formatted().prefix(9)))!
print(nextDate == formatedToday)
nextDate = Calendar.current.date(byAdding: .day, value: 1, to: nextDate)!
print(nextDate == Date())

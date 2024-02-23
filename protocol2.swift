//Создать протокол с одним методом и 2 свойствами
import Foundation

@objc protocol Students {
    var fullname: String {get}
    @objc optional var group: Int {get}
    
    func printname()
}

class Pupil: Students {
    var fullname: String
    init(fullname: String){
        self.fullname = fullname
    }
    
    func printname() {
         print("Имя \(fullname)")
    }
}

let i = Pupil(fullname: "Кадченко Иван Васильевич")
i.printname()

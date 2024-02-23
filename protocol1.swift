// Реализовать структуру IOSCollection и создать в ней copy on write по типу
func address(of object: UnsafeRawPointer) -> Void {
  let addr = Int(bitPattern: object)
  print(addr)
}

func address(off value: AnyObject) -> Void {
  print("\(Unmanaged.passUnretained(value).toOpaque())")
}

struct IOSCollection {
  var type = "Адрес"
}

class Ref<T> {
  var value: T
  init(value: T) {
    self.value = value
  }
}

struct Container<T> {
  var ref: Ref<T>
  init(value: T) {
    self.ref = Ref(value: value)
  }

  var value: T {
    get {
      return ref.value
    }
    set {
      guard (isKnownUniquelyReferenced(&ref)) else {
        ref = Ref(value: newValue)
        return
      } 
      ref.value = newValue
    }
 }
}


var type = IOSCollection()
var container1 = Container(value: type)
var container2 = container1

address(off: container1.ref)
address(off: container2.ref)

container2.value.type = "Новый Адрес"

address(off: container1.ref)
address(off: container2.ref)

// протокол *Hotel*


import Foundation

protocol Hotel {
    var roomCount: Int { get }
    
    init(roomCount: Int)
}

class HotelAlfa: Hotel {
    var roomCount: Int
    
    required init(roomCount: Int) {
        self.roomCount = roomCount
    }
}

// protocol GameDice
import Foundation
protocol GameDice {
    var numberDice: Int { get }
}
extension Int: GameDice {
    var numberDice: Int {
        return self
    }
}
let diceCoub = 4
print("Выпало \(diceCoub.numberDice) на кубике") 

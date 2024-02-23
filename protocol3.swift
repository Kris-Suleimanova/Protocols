protocol Cod {
    var timeSpent: Int { get set }
    var linesOfCode: Int { get set }
    
    func writeCode(for platform: Platform, withNumberOfSpecialists numberOfSpecialists: Int)
}

protocol Stop {
    func stopCodingProcess()
}

enum Platform {
    case ios, android, web
}

class SoftwareCompany: Cod, Stop {
    var timeSpent: Int
    var linesOfCode: Int
    var numberOfProgrammers: Int
    var specializedPlatforms: [Platform]
    
    init(numberOfProgrammers: Int, specializedPlatforms: [Platform]) {
        self.numberOfProgrammers = numberOfProgrammers
        self.specializedPlatforms = specializedPlatforms
        self.timeSpent = 0
        self.linesOfCode = 0
    }
    
 func writeCode(for platform: Platform, withNumberOfSpecialists numberOfSpecialists: Int) {
    if !specializedPlatforms.contains(platform) || numberOfSpecialists > numberOfProgrammers || numberOfSpecialists==0  {
        print("Недостаточно специалистов для разработки.")
        return
    }
    
    print("Разработка началась. пишем код \(platform).")
    timeSpent += 3
    linesOfCode += numberOfSpecialists * 10
    print("Время: \(timeSpent)")
    print("Количество строк кода: \(linesOfCode)")

}

func stopCodingProcess() {
    print("Разработка завершена. Переходим к тестированию.")
}

}

var m = [Platform]()
m.append(.ios)
m.append(.android)
m.append(.web)

let k = SoftwareCompany(numberOfProgrammers: 15, specializedPlatforms: m)
k.writeCode(for: .web, withNumberOfSpecialists: 16)
k.writeCode(for: .android, withNumberOfSpecialists: 0)
k.writeCode(for: .ios, withNumberOfSpecialists: 8)
k.stopCodingProcess()

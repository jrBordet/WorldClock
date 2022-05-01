public func timeInWords(
    h: Int,
    m: Int
) -> String {
	Time(
        hour: h,
        minutes: m
    ).timeInWords
}

public func time12InWords(
    h: Int,
    m: Int
) -> TimeIn12Components {
    let result = time12(h, minutes: m)
    
    return TimeIn12Components(
        hour: result.hour,
        minutes: result.minutes,
        accessory: result.accessory
    )    
}


public struct TimeIn12Components: Equatable {
    public var hour: WordNumber
    public var minutes: WordNumber
    public var accessory: Accessory
    
    public init (
     hour: WordNumber,
     minutes: WordNumber,
     accessory: Accessory
    ) {
        self.hour = hour
        self.minutes = minutes
        self.accessory = accessory
    }
}

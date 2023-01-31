/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TCalendar)
public class TCalendar: _TCalendar {
}

@objc(TCalendarObject)
public class TCalendarObject: _TCalendarObject {
}


#elseif canImport(Alamofire)

@objc(TCalendarObject)
public class TCalendarObject: _TCalendarObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/
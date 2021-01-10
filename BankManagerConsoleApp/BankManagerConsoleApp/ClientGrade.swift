
import Foundation

enum ClientGrade: Int, CaseIterable {
    case VVIP = 0
    case VIP
    case normal
    
    var description: String {
        switch self {
        case .VVIP:
            return "VVIP"
        case .VIP:
            return "VIP"
        case .normal:
            return "일반"
        }
    }
}

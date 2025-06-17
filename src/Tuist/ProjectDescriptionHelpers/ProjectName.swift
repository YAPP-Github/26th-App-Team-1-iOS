import ProjectDescription

public enum BKModule: String {
    case Booket
    case BKCore
    case BKDesign
    case BKNetwork
    case BKStorage
    case BKData
    case BKDomain
    case BKPresentation
}

extension BKModule: CaseIterable {}

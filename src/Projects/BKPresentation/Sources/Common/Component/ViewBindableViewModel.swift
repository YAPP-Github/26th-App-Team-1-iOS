// Copyright © 2025 Booket. All rights reserved

import Combine

/// 구현된 ViewModel을 View에 Binding하기 위한 타입입니다.
///
/// ViewModel에서 사용하지 마세요. 단, SideEffect를 다루지 않는 간단한 상태 변환이라면 괜찮습니다.
/// 자세한 내용은 AnyViewBindableViewMode 문서를 참고하세요.
protocol ViewBindableViewModel {
    associatedtype Action
    associatedtype State
    
    var statePublisher: AnyPublisher<State, Never> { get }
    func send(_ action: Action)
}

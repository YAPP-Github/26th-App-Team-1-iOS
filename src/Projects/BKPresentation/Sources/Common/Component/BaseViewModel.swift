// Copyright © 2025 Booket. All rights reserved

import Combine

/// ViewModel을 위한 Base 컴포넌트
///
/// Asynchronous한 작업을 위한 SideEffect를 분리하기 위해 Redux 스타일로 `handle(_:)`과 `reduce(_:)`를 구현해야 합니다.
/// ViewModel 구현 시에만 사용되며, UIViewController에서 사용되지 않도록 주의해야 합니다.
protocol BaseViewModel: ViewBindableViewModel {
    associatedtype SideEffect

    func reduce(action: Action, state: State) -> (State, [SideEffect])
    func handle(_ effect: SideEffect) -> AnyPublisher<Action, Never>
}

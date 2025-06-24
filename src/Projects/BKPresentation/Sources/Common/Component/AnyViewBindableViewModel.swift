// Copyright © 2025 Booket. All rights reserved

import Combine

/// ViewController에서 ViewModel을 바인딩하기 위한 타입
///
/// ViewBindableViewModel을 Opaque Type 이슈로 바로 사용할 수 없어,
/// Type Erasing을 통해 사용 가능하도록 한 구현체입니다.
///
/// ## Example
/// ```swift
/// let viewmodel = AnyViewBindableViewModel(SomeReducibleViewModel())
/// ```
///
final class AnyViewBindableViewModel<State, Action>: ViewBindableViewModel {
    // MARK: - Properties
    private let _statePublisher: AnyPublisher<State, Never>
    private let _send: (Action) -> Void

    var statePublisher: AnyPublisher<State, Never> { _statePublisher }

    // MARK: - Initializer
    init<VM: ViewBindableViewModel>(_ base: VM) where VM.State == State, VM.Action == Action {
        self._statePublisher = base.statePublisher
        self._send = base.send
    }

    // MARK: - Methods
    func send(_ action: Action) {
        _send(action)
    }
}

import ProjectDescription
import Foundation

let projectDir = ProcessInfo.processInfo.environment["PROJECT_DIR"] ?? ""
let swiftLintConfigPath = "\(projectDir)/../../.swiftlint.yml"


public let swiftLintScript: TargetScript = .pre(
    script: """
    export PATH="/opt/homebrew/bin:$PATH"
    
    SWIFTLINT_PATH=$(which swiftlint)
    SWIFTLINT_CONFIG_PATH="${SRCROOT%/*/*}/.swiftlint.yml"
        
    if [ -n "$SWIFTLINT_PATH" ]; then
        swiftlint --config "$SWIFTLINT_CONFIG_PATH"
    else
        echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
    fi
    """,
    name: "SwiftLint",
    basedOnDependencyAnalysis: false
)

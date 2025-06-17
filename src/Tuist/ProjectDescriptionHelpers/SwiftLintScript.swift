import ProjectDescription
import Foundation

let projectDir = ProcessInfo.processInfo.environment["PROJECT_DIR"] ?? ""
let swiftLintConfigPath = "\(projectDir)/../../.swiftlint.yml"


public let swiftLintScript: TargetScript = .pre(
    script: """
    if which swiftlint > /dev/null; then
      swiftlint --config "\(swiftLintConfigPath)"
    else
      echo "warning: SwiftLint not installed"
    fi
    """,
    name: "SwiftLint",
    basedOnDependencyAnalysis: false
)

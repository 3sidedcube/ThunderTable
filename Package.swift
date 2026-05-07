// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "ThunderTable",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ThunderTable",
            targets: ["ThunderTable"]
        )
    ],
    targets: [
        .target(
            name: "ThunderTable",
            path: "Sources/ThunderTable",
            resources: [
                .process("DefaultTableViewCell.xib"),
                .process("InputDatePickerViewCell.xib"),
                .process("InputInlineDatePickerViewCell.xib"),
                .process("InputPickerViewCell.xib"),
                .process("InputSliderViewCell.xib"),
                .process("InputSwitchViewCell.xib"),
                .process("InputTextFieldViewCell.xib"),
                .process("InputTextViewCell.xib"),
                .process("SubtitleTableViewCell.xib"),
                .process("TableImageViewCell.xib"),
                .process("TableViewCell.xib"),
                .process("Value1TableViewCell.xib"),
                .process("Value2TableViewCell.xib")
            ]
        ),
        .testTarget(
            name: "ThunderTableTests",
            dependencies: ["ThunderTable"],
            path: "Tests/ThunderTableTests"
        )
    ]
)

load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

filegroup(
    name = "AppIcon",
    srcs = glob(["Assets.xcassets/AppIcon.appiconset/**"]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "Assets",
    srcs = glob([
        "Assets.xcassets/**/*",
    ],
    exclude = [
        "Assets.xcassets/*.appiconset/**",
    ]),
    visibility = ["//visibility:public"],
)

googlemlkitdeps = [
    "//Rome:FBLPromises",
    "//Rome:GTMSessionFetcher",
    "//Rome:GoogleDataTransport",
    "//Rome:GoogleToolboxForMac",
    "//Rome:GoogleUtilities",
    "//Rome:GoogleUtilitiesComponents",
    "//Rome:Protobuf",
    "//Rome:nanopb",
    "//Rome:MLKitBarcodeScanning",
    "//Rome:MLKitCommon",
    "//Rome:MLKitVision",
]

swift_library(
    name = "Modules",
    srcs = glob(["**/*.swift"]),
    data = glob([
        "**/*.storyboard",
        "**/*.xib",
        "**/*.xcassets/**",
        "**/*.plist",
        "**/*.lproj/**",
    ]) + ["//Fonts"],
    deps = [
        "//Rome:GONMarkupParser",
        "//Rome:Keys",
        "//Rome:NSString_Color",
        "//Modules/Barcode:ModulesBarcodeBIN",
    ] + googlemlkitdeps,
)

ios_application(
    name = "ModulesApp",
    # To reuse available provisioning profile use 'com.muiz.idn.movieboom.ios'
    # bundle_id = "com.muiz.idn.movieboommodule.ios",
    bundle_id = "com.muiz.idn.movieboom.ios",
    families = [
        "iphone",
        "ipad",
    ],
    app_icons = [":AppIcon"],
    resources = [":Assets"],
    minimum_os_version = "12.0",
    infoplists = [
        "Plist_Info.plist",
    ],
    visibility = ["//visibility:public"],
    provisioning_profile = select({
        "//config:adhoc":"//provisioning_profiles:release_adhoc.mobileprovision",
        "//config:production":"//provisioning_profiles:release_appstore.mobileprovision",
        "//config:develop":"//provisioning_profiles:dev.mobileprovision",
    }),
    deps = [
        ":Modules",
    ],
    frameworks = [
        "//Modules/Barcode:ModulesBarcodeFW"
    ]
)
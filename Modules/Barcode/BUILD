load("@build_bazel_rules_apple//apple:ios.bzl", "ios_framework")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "ModulesBarcodeBIN",
    srcs = glob(["**/*.swift"]),
    data = glob([
        "**/*.storyboard",
        "**/*.xib",
        "**/*.xcassets/**",
        "**/*.plist",
        "**/*.lproj/**"
    ]) + ["//Fonts"],
    deps = [
        "//deps:Rswift",
    ],
    visibility = ["//visibility:public"],
)

ios_framework(
    name = "ModulesBarcodeFW",
    bundle_id = "com.muiz.idn.movieboom.ios.module.barcode",
    families = [
        "iphone",
        "ipad",
    ],
    minimum_os_version = "12.0",
    infoplists = [
        "Plist_Barcode_Info.plist",
    ],
    visibility = ["//visibility:public"],
    provisioning_profile = select({
        "//config:adhoc":"//provisioning_profiles:release_adhoc.mobileprovision",
        "//config:production":"//provisioning_profiles:release_appstore.mobileprovision",
        "//config:develop":"//provisioning_profiles:dev.mobileprovision",
    }),
    deps = [
        ":ModulesBarcodeBIN",
    ],
    frameworks = []
)

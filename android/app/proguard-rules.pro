# Keep mobile_scanner classes
-keep class com.github.arnaudelub.mobile_scanner.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep camera classes
-keep class androidx.camera.** { *; }

# Keep ML Kit classes
-keep class com.google.mlkit.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class com.google.android.datatransport.** { *; }

# Keep ZXing classes for QR code scanning
-keep class com.google.zxing.** { *; }
-dontwarn com.google.zxing.**

# Keep CameraX classes
-keep class androidx.camera.** { *; }
-keep class androidx.camera.camera2.** { *; }
-keep class androidx.camera.core.** { *; }
-keep class androidx.camera.lifecycle.** { *; }
-keep class androidx.camera.view.** { *; }

# Keep mobile scanner native classes
-keep class ** { native <methods>; }
-keepclasseswithmembernames class * { native <methods>; }

# Flutter embedding classes
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.view.** { *; }

# Keep Kotlin classes
-keepclassmembers class **$WhenMappings {
    <fields>;
}

# Keep serialization classes
-keepattributes *Annotation*, InnerClasses
-dontnote kotlinx.serialization.AnnotationsKt

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep classes that are referenced by JNI
-keepclasseswithmembers class * {
    native <methods>;
}

# Don't obfuscate mobile scanner classes
-keep class * extends io.flutter.plugin.common.MethodCallHandler
-keep class * extends io.flutter.plugin.common.EventChannel$StreamHandler

# Don't warn about missing classes
-dontwarn com.github.arnaudelub.mobile_scanner.**
-dontwarn androidx.camera.**
-dontwarn com.google.mlkit.**
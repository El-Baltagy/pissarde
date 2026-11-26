# org.slf4j missing classes
-dontwarn org.slf4j.**

# Play Core deferred components (referenced by Flutter engine but not used)
-dontwarn com.google.android.play.core.**

# Pusher rules if needed
-keep class com.pusher.client.** { *; }

# Standard Flutter rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
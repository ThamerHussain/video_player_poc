package com.example.my_exoplayer

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class MyExoplayerPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var binding: FlutterPlugin.FlutterPluginBinding

  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    this.binding = binding
    channel = MethodChannel(binding.binaryMessenger, "my_exoplayer")
    channel.setMethodCallHandler(this)

    // Register the view factory
    binding
      .platformViewRegistry
      .registerViewFactory(
        "my_exoplayer_view",
        ExoPlayerViewFactory(binding.binaryMessenger, this)
      )
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    // Global plugin methods can be handled here
    when (call.method) {
      "getPlatformVersion" -> {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
package com.example.my_exoplayer

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class ExoPlayerViewFactory(
    private val messenger: BinaryMessenger,
    private val plugin: MyExoplayerPlugin
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map?
        return ExoPlayerView(context, viewId, messenger, creationParams, plugin)
    }
}
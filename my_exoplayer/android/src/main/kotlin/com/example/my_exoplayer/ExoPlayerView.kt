package com.example.my_exoplayer

import android.content.Context
import android.view.View
import android.net.Uri
import android.widget.FrameLayout
import com.google.android.exoplayer2.ExoPlayer
import com.google.android.exoplayer2.MediaItem
import com.google.android.exoplayer2.ui.StyledPlayerView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

class ExoPlayerView(
    private val context: Context,
    id: Int,
    messenger: BinaryMessenger,
    creationParams: Map?,
    private val plugin: MyExoplayerPlugin
) : PlatformView, MethodChannel.MethodCallHandler {

    private val channel = MethodChannel(messenger, "my_exoplayer_$id")
    private val exoPlayerView: StyledPlayerView
    private val layout: FrameLayout
    private var player: ExoPlayer? = null

    init {
        channel.setMethodCallHandler(this)

        layout = FrameLayout(context)
        exoPlayerView = StyledPlayerView(context)
        layout.addView(exoPlayerView)

        // Initialize player instance
        player = ExoPlayer.Builder(context).build()
        exoPlayerView.player = player

        // Get initial URL if provided
        creationParams?.let {
            if (it.containsKey("url")) {
                val url = it["url"] as String
                loadUrl(url)
            }
        }
    }

    override fun getView(): View {
        return layout
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "loadUrl" -> {
                val url = call.argument("url")
                if (url != null) {
                    loadUrl(url)
                    result.success(null)
                } else {
                    result.error("INVALID_URL", "URL cannot be null", null)
                }
            }
            "play" -> {
                player?.play()
                result.success(null)
            }
            "pause" -> {
                player?.pause()
                result.success(null)
            }
            "seekTo" -> {
                val position = call.argument("position")
                if (position != null) {
                    player?.seekTo(position.toLong())
                    result.success(null)
                } else {
                    result.error("INVALID_POSITION", "Position cannot be null", null)
                }
            }
            "setVolume" -> {
                val volume = call.argument("volume")
                if (volume != null) {
                    player?.volume = volume.toFloat()
                    result.success(null)
                } else {
                    result.error("INVALID_VOLUME", "Volume cannot be null", null)
                }
            }
            "getDuration" -> {
                result.success(player?.duration)
            }
            "getCurrentPosition" -> {
                result.success(player?.currentPosition)
            }
            "isPlaying" -> {
                result.success(player?.isPlaying)
            }
            else -> result.notImplemented()
        }
    }

    private fun loadUrl(url: String) {
        val mediaItem = MediaItem.fromUri(Uri.parse(url))
        player?.apply {
            setMediaItem(mediaItem)
            prepare()
        }
    }

    override fun dispose() {
        channel.setMethodCallHandler(null)
        player?.release()
        player = null
    }
}
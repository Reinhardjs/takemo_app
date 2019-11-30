package com.takemo.takemo_app

import android.os.Bundle
import android.widget.Toast
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "flutter.native/toast_helper"
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->

            if (call.method == "showToast") {

                Toast.makeText(applicationContext, "Hello, Wash!", Toast.LENGTH_LONG).show()
                result.success("hello")

            }
        }
    }
}

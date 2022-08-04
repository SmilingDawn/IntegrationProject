package com.smilingdawn.integrationproject

import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

class NativeCountModule(reactContext: ReactApplicationContext): ReactContextBaseJavaModule(reactContext) {
    override fun getName(): String {
        return "NativeCountModule"
    }

    @ReactMethod
    fun sendValue(value: String) {
        Log.d("NativeCountModule", "sendValue : $value")
    }

    @ReactMethod
    fun sendValueInt(value: Int) {
        Log.d("NativeCountModule", "sendValueInt : $value")
    }

    @ReactMethod
    fun addEvent(name: String, location: String, date: Int) {
        Log.d("NativeCountModule" , "addEvent name: ${name}, location: ${location}, date: $date")
    }
}
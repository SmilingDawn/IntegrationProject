package com.smilingdawn.integrationproject

import android.util.Log
import com.facebook.react.bridge.*

class NativeCounterManager(reactContext: ReactApplicationContext): ReactContextBaseJavaModule(reactContext) {
    private var count: Int = 0

    override fun getName(): String {
        return "NativeCounterManager"
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
    fun increment(callback: Callback) {
        count += 1
        callback.invoke(count)
    }

    @ReactMethod
    fun decrement(promise: Promise) {
        if (count == 0) {
            val e = Error("count cannot be negative")
            promise.reject(e)
        } else {
            count -= 1
            promise.resolve(count)
        }
    }

    @ReactMethod
    fun addEvent(name: String, location: String, date: Int) {
        Log.d("NativeCountModule" , "addEvent name: ${name}, location: ${location}, date: $date")
    }

}
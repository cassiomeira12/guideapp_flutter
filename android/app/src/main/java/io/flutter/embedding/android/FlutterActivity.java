package io.flutter.embedding.android;
//
//import android.content.Intent;
//
//import androidx.annotation.NonNull;
//
//import com.example.guideapp_flutter.graphic.GraphicActivity;
//
//import io.flutter.embedding.android.FlutterActivity;
//import io.flutter.embedding.engine.FlutterEngine;
//import io.flutter.plugin.common.MethodChannel;
//

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class FlutterActivity extends FlutterFragmentActivity {
    private static final String CHANNEL = "com.example.guideapp_flutter/page";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
        .setMethodCallHandler((call, result) -> {
            if (call.method.equals("graphic")) {
                //Intent intent = new Intent(this, GraphicActivity.class);
                //startActivity(intent);
                // result.success(true);
            } else {
                result.notImplemented();
            }
        });
    }
}
//public class FlutterActivity extends FlutterActivity {
//    private static final String CHANNEL = "com.example.guideapp_flutter/page";
//
//    @Override
//    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
//        super.configureFlutterEngine(flutterEngine);
//        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
//                .setMethodCallHandler((call, result) -> {
//                    if (call.method.equals("graphic")) {
//                        //Intent intent = new Intent(this, GraphicActivity.class);
//                        //startActivity(intent);
//                        // result.success(true);
//                    } else {
//                        result.notImplemented();
//                    }
//                });
//    }
//
//}

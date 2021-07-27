package com.wyq.xiangxue_project;

import android.os.Bundle;

import io.flutter.embedding.android.FlutterActivity;
import org.devio.flutter.splashscreen.SplashScreen;

public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        SplashScreen.show(this, true);// here
        super.onCreate(savedInstanceState);
    }
}

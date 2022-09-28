package com.example.guideapp_flutter.graphic;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.example.guideapp_flutter.R;
import com.example.guideapp_flutter.databinding.ActivityGraphicBinding;

import androidx.appcompat.app.AppCompatActivity;

public class GraphicActivity extends AppCompatActivity {
    private ActivityGraphicBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityGraphicBinding.inflate(getLayoutInflater());

        setContentView(binding.getRoot());

        binding.buttonFirst1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                System.out.println("botao1");
                //Intent intent = MainActivity.withNewEngine().build(GraphicActivity.this);
                //startActivity(intent);
                //startActivity(MainActivity.createDefaultIntent(GraphicActivity.this));
            }
        });

        binding.buttonFirst2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                System.out.println("botao2");
            }
        });

        // setContentView(R.layout.activity_graphic);
    }
}
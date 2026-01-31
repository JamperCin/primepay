package com.kodeit.prime.prime_pay;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import com.qs.util.PrintUtils;

import android.widget.Toast;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import com.kodeit.prime.prime_pay.PrinterHelper;
import com.kodeit.prime.prime_pay.PrinterType;


public class MainActivity extends FlutterActivity {
    private static final String PRINT_CHANNEL = "primepay.print.receipt";

    /// ------- PRINTING METHODS --------------------------
    private static final String PRINT_TEXT_METHOD = "print_text";
    private static final String PRINT_IMAGE_METHOD = "print_image";

    /// ------- PRINTER TYPE -----
    private static final String PRINT_TYPE_METHOD = "print_type_method";
    private static final String PRINT_TYPE = "print_type";

    /// ------------ PRINTING ARGUMENTS -------------------
    private static final String TEXT = "text";
    private static final String TEXT_SIZE = "text_size";
    private static final String TEXT_ALIGNMENT = "text_alignment";
    private static final String TEXT_STYLE = "text_style";
    private static final String IMAGE_RESOURCE = "image_resource";
    private static final String IMAGE_ALIGNMENT = "image_alignment";

    /// --------------- PRINTING UTILS ----------------------
    private static final String SUCCESS_MESSAGE = "success";
    private static final int DEFAULT_LOGO = R.drawable.prime_pay;

    /// --------------- PRINTING FONT SIZES --------------
    private static final int NORMAL_FONT_SIZE = 1;
    private static final int LARGE_FONT_SIZE = 2;

    /// ------------- TEXT ALIGNMENT ---------------------
    private static final int ALIGN_MIDDLE = 1;
    private static final int ALIGN_RIGHT = 2;
    private static final int ALIGN_LEFT = 0;

    /// ------------- TEXT STYLES ---------------------
    private static final int NORMAL = 0;
    private static final int BOLD = 1;
    private static final int ITALIC = 2;
    private static final int BOLD_ITALIC = 3;

    /// --------- IMAGE ALIGNMENT -----------------------
    private static final int IMAGE_ALIGN_MIDDLE = 80;
    private static final int IMAGE_ALIGN_RIGHT = 140;
    private static final int IMAGE_ALIGN_LEFT = 0;
    private PrinterHelper printerHelper;


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);


        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), PRINT_CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {

                            //If the method call is to print text then call the method printText()
                            if (call.method.equals(PRINT_TEXT_METHOD) && call.argument(TEXT) != null) {
                                String text = call.argument(TEXT);
                                int size = call.argument(TEXT_SIZE) == null ? NORMAL_FONT_SIZE : call.argument(TEXT_SIZE);
                                int align = call.argument(TEXT_ALIGNMENT) == null ? ALIGN_LEFT : call.argument(TEXT_ALIGNMENT);
                                int style = call.argument(TEXT_STYLE) == null ? NORMAL : call.argument(TEXT_STYLE);
                                printerHelper.printText(text, size, style, align, result);
                            }

                            //If the method is to print Image then call this method
                            if (call.method.equals(PRINT_IMAGE_METHOD)) {
                                int resource = call.argument(IMAGE_RESOURCE) == null ? DEFAULT_LOGO : call.argument(IMAGE_RESOURCE);
                                int align = call.argument(IMAGE_ALIGNMENT) == null ? IMAGE_ALIGN_MIDDLE : call.argument(IMAGE_ALIGNMENT);
                                printerHelper.printImage(resource, align, result);
                            }

                            if (call.method.equals(PRINT_TYPE_METHOD)) {
                                String printerType = call.argument(PRINT_TYPE);
                                PrinterType type = PrinterType.NO_PRINTING;
                                switch (printerType) {
                                    case "QUONSUO_PDA":
                                        type = PrinterType.QUONSUO_PDA;
                                        break;
                                    case "Z91":
                                        type = PrinterType.Z91;
                                        break;
                                    default:
                                        type = PrinterType.NO_PRINTING;
                                        break;
                                }
                                printerHelper = new PrinterHelper(this, type);
                                result.success(SUCCESS_MESSAGE);
                            }
                        }
                );
    }


//    private void printText(String text, int fontSize, int align, MethodChannel.Result result){
//        PrintUtils.printText(fontSize,60, align, false,text + "\n");
//        result.success(SUCCESS_MESSAGE);
//    }
//
//
//    private void printImage(int resource,int align, MethodChannel.Result result){
//        Bitmap btMap = BitmapFactory.decodeResource(getResources(), resource);
//
//        PrintUtils.printBitmap(60, align, false, btMap);
//        result.success(SUCCESS_MESSAGE);
//    }

}

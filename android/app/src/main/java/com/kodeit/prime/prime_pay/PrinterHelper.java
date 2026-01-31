package com.kodeit.prime.prime_pay;

import android.app.Activity;
import android.widget.Toast;

import com.kodeit.prime.prime_pay.PrinterType;
import android.text.Layout;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import io.flutter.plugin.common.MethodChannel;

//z91
import com.zcs.sdk.DriverManager;
import com.zcs.sdk.Printer;
import com.zcs.sdk.SdkResult;
import com.zcs.sdk.print.PrnStrFormat;
import com.zcs.sdk.print.PrnTextFont;
import com.zcs.sdk.print.PrnTextStyle;

///Quo
import com.qs.util.PrintUtils;


class PrinterHelper {
    private Activity activity;

    //Set the printer type from here
    private PrinterType printerType = PrinterType.NO_PRINTING;


    ///--------------- PRINTING UTILS ----------------------
    private static final String SUCCESS_MESSAGE = "success";
    private static final int DEFAULT_LOGO = R.drawable.prime_pay;


    private DriverManager mDriverManager;
    private Printer mPrinter;

    ///No more using this at the moment
    public PrinterHelper(Activity activity) {
        this.activity = activity;
        init();
    }

    ///Using this to define the Printer Type during runTime
    public PrinterHelper(Activity activity, PrinterType printerType) {
        this.activity = activity;
        this.printerType = printerType;
        init();
    }

    private void init() {
        switch (printerType) {
            case QUONSUO_PDA:
                PrintUtils.initPrintUtils(activity);
                break;
            case Z91:
                mDriverManager = DriverManager.getInstance();
                mPrinter = mDriverManager.getPrinter();
                break;
        }
    }


    public void printText(String text, int fontSize, int style, int align, MethodChannel.Result result) {
        switch (printerType) {
            case QUONSUO_PDA:
                quonsuoPrintText(text, fontSize, style, align, result);
                break;
            case Z91:
                z91PrintText(text, fontSize, style, align, result);
                break;
        }
    }

    public void printImage(int resource, int align, MethodChannel.Result result) {
        switch (printerType) {
            case QUONSUO_PDA:
                quonsuoPrintImage(resource, align, result);
                break;
            case Z91:
                z91PrintImage(resource, align, result);
                break;
        }
    }

    // =============== QUONSUO PDA ==============
    private void quonsuoPrintText(String text, int fontSize, int style, int align, MethodChannel.Result result) {
        PrintUtils.printText(fontSize, 60, align, false, text + "\n");
        result.success(SUCCESS_MESSAGE);
    }

    private void quonsuoPrintImage(int resource, int align, MethodChannel.Result result) {
        Bitmap btMap = BitmapFactory.decodeResource( activity.getResources(), resource);

        PrintUtils.printBitmap(60, align, false, btMap);
        result.success(SUCCESS_MESSAGE);
    }
    //=================================================


    //=============== Z91 ===========================
    private void z91PrintText(String text, int fontSize, int style, int align, MethodChannel.Result result) {
        int printStatus = mPrinter.getPrinterStatus();
        if (printStatus == SdkResult.SDK_PRN_STATUS_PAPEROUT) {
            Toast.makeText(activity, "Out of paper", Toast.LENGTH_SHORT).show();
            return;
        }

        PrnStrFormat format = new PrnStrFormat();
        format.setTextSize(fontSize == 0 ? 22 : fontSize == 1 ? 25 : 30);
        format.setAli(align == 0 ? Layout.Alignment.ALIGN_NORMAL : align == 1 ? Layout.Alignment.ALIGN_CENTER : Layout.Alignment.ALIGN_OPPOSITE);
        format.setStyle(style == 0 ? PrnTextStyle.NORMAL : style == 1 ? PrnTextStyle.BOLD : style == 2 ? PrnTextStyle.ITALIC : PrnTextStyle.BOLD_ITALIC);
        format.setFont(PrnTextFont.SANS_SERIF);
        mPrinter.setPrintAppendString(text, format);

        printStatus = mPrinter.setPrintStart();

        result.success(SUCCESS_MESSAGE);
    }

    private void z91PrintImage(int resource, int align, MethodChannel.Result result) {
        Bitmap bitmap = BitmapFactory.decodeResource( activity.getResources(), resource);

        int printStatus = mPrinter.getPrinterStatus();
        if (printStatus != SdkResult.SDK_PRN_STATUS_PAPEROUT) {
            mPrinter.setPrintAppendBitmap(bitmap, align == 0 ? Layout.Alignment.ALIGN_NORMAL : align == 80 ? Layout.Alignment.ALIGN_CENTER : Layout.Alignment.ALIGN_OPPOSITE);
            printStatus = mPrinter.setPrintStart();
        }
        result.success(SUCCESS_MESSAGE);
    }
    //===============================================
}
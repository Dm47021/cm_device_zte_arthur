package com.cyanogenmod.settings.device;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.app.Activity;
import com.cyanogenmod.settings.device.utils.Utils;


public class WarpedPartsStartup extends BroadcastReceiver
{
    @Override
    public void onReceive(final Context context, final Intent bootintent) {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        // USB charging
        if(prefs.getBoolean("usb_charging", true)) {
            Utils.writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 1);
        }
        else {
            Utils.writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 0);
        }
        //Hardware Acceleration
        if(prefs.getBoolean("hwacc", true)) {
            android.os.SystemProperties.set(debug.sf.hw, 1);
        }
        else {
            android.os.SystemProperties.set(debug.sf.hw, 0);
        }
    }
}

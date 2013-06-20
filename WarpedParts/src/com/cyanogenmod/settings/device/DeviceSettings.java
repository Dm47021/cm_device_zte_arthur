
package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.app.Activity;
import android.view.View;
import android.widget.CheckBox;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.PowerManager;

import com.cyanogenmod.settings.device.utils.Utils;
import com.cyanogenmod.settings.device.utils.RebootDialog;

public class DeviceSettings extends PreferenceActivity {

    private static final String KEY_HWACC = "hwacc";
    private static final CheckBox cb = (CheckBox) findViewById(R.id.cbacc);

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        onStartup(this);
        addPreferencesFromResource(R.xml.warpedparts);
    }

    public void onCheckboxClicked(View view) {
        // Is the view now checked?
        boolean checked = ((CheckBox) view).isChecked();

        // Check which checkbox was clicked
        switch (view.getId()) {
            case R.id.hwacc:
                if (checked)
                    if (android.os.SystemProperties.get(debug.sf.hw) == 0) {
                        android.os.SystemProperties.set(debug.sf.hw, 1);
                        checkboxChanged("hwacc");
                        Utils.checkboxChanged();
                    }
                    else if (android.os.SystemProperties.get(debug.sf.hw) == 1) {
                        android.os.SystemProperties.set(debug.sf.hw, 0);
                        checkboxChanged("hwacc");
                        Utils.checkboxChanged();
                    }
                break;
        }
    }

    @Override
    public void onPause() {
        super.onPause();
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
        // USB charging
        if (prefs.getBoolean("usb_charging", true))
            Utils.writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 1);
        else
            Utils.writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 0);
    }

    public void checkboxChanged(String p) {

        if (p == "hwacc") {
            RebootDialog r = new RebootDialog(this);
        }
    }

    public static void onStartup(Context context) {

        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);

        if (prefs.getBoolean(KEY_HWACC, true)) {
            android.os.SystemProperties.set(debug.sf.hw, 1);
        } else {
            android.os.SystemProperties.set(debug.sf.hw, 0);
        }
    }

}

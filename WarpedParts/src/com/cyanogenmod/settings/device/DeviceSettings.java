package com.cyanogenmod.settings.device;

import com.cyanogenmod.settings.device.R;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.app.Activity;
import android.widget.CheckBox;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.PowerManager;

public class DeviceSettings extends PreferenceActivity {
    
    public CheckBox cb = (CheckBox) findViewById(android.R.id.cbacc);

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        addPreferencesFromResource(R.xml.warpedparts);
        }
    
    public void onCheckboxClicked(View view) {
        // Is the view now checked?
        boolean checked = ((CheckBox) view).isChecked();
        
        // Check which checkbox was clicked
        switch(view.getId()) {
            case R.id.hwacc:
                if (checked)
                    if(android.os.SystemProperties.get(debug.sf.hw) == 0){
                        android.os.SystemProperties.set(debug.sf.hw, 1);
                        checkboxChanged();
                    }
                else
                    if(android.os.SystemProperties.get(debug.sf.hw) == 1){
                        android.os.SystemProperties.set(debug.sf.hw, 0);
                        checkboxChanged();
                    }
                break;
        }
    }

    @Override
    public void onPause() {
        super.onPause();
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
        // USB charging
        if(prefs.getBoolean("usb_charging", true))
            Utils.writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 1);
        else
            Utils.writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 0);
    }
    
    public void checkboxChanged() {
        String s = "CAUTION!!!";
        String t = "Changing this option requires a full reboot. Reboot now?";
        String y = "Reboot Now";
        String n = "Not Now";
        String c = "Cancel";
        
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());

// 
        builder.setMessage(t)
               .setTitle(s);
               
        builder.setPositiveButton(y, new DialogInterface.OnClickListener() {
           public void onClick(DialogInterface dialog, int id) {
               PowerManager powerManager = (PowerManager) getSystemService(Context.POWER_SERVICE);
               powerManager.reboot(null);
           }
       });
        builder.setNegativeButton(c, new DialogInterface.OnClickListener() {
           public void onClick(DialogInterface dialog, int id) {
               if(android.os.SystemProperties.get(debug.sf.hw) == 0){
                        android.os.SystemProperties.set(debug.sf.hw, 1);
                    }
                else
                    if(android.os.SystemProperties.get(debug.sf.hw) == 1){
                        android.os.SystemProperties.set(debug.sf.hw, 0);
                    }
           }
       });
        builder.setNeutralButton(c, new DialogInterface.OnClickListener() {
           public void onClick(DialogInterface dialog, int id) {
               
           }
       });


        AlertDialog dialog = builder.create();
    }
}

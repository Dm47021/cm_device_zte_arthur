package com.cyanogenmod.settings.device;

import com.cyanogenmod.settings.device.R;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;

import java.io.FileNotFoundException;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.StringTokenizer;

public class DeviceSettings extends PreferenceActivity {
    private boolean hasdata = false;
    private int xoffset, yoffset, xscale, yscale;

    private void loadCalData() {
        try {
           FileInputStream fis = new FileInputStream("/data/system/pointercal");
           BufferedReader buf = new BufferedReader(new InputStreamReader(fis));
           String readString = new String();
           if ((readString = buf.readLine()) != null) {
              // Split string and parse values
              StringTokenizer st = new StringTokenizer(readString, " ");
	      xscale = Integer.parseInt(st.nextToken());
	      if(!st.hasMoreTokens()) return;
	      int temp = Integer.parseInt(st.nextToken());
	      if(!st.hasMoreTokens()) return;
	      xoffset = Integer.parseInt(st.nextToken());
	      if(!st.hasMoreTokens()) return;
	      temp = Integer.parseInt(st.nextToken());
	      if(!st.hasMoreTokens()) return;
	      yscale = Integer.parseInt(st.nextToken());
	      if(!st.hasMoreTokens()) return;
	      yoffset = Integer.parseInt(st.nextToken());
	      if(!st.hasMoreTokens()) return;
	      temp = Integer.parseInt(st.nextToken().trim());
              hasdata = true;
           }
           fis.close();
        } catch (FileNotFoundException e) {
           e.printStackTrace();
        } catch (IOException e) {
           e.printStackTrace();
        }
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        addPreferencesFromResource(R.xml.v9parts);
    }

    @Override
    public void onPause() {
        super.onPause();
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(getBaseContext());

        // Touchscreen calibration
        loadCalData();
        if(hasdata) {
           Utils.writeValue("/sys/module/msm_ts/parameters/tscal_xoffset",xoffset);
           Utils.writeValue("/sys/module/msm_ts/parameters/tscal_yoffset",yoffset);
           Utils.writeValue("/sys/module/msm_ts/parameters/tscal_xscale",xscale);
           Utils.writeValue("/sys/module/msm_ts/parameters/tscal_yscale",yscale);
        }

        // Gesture emulation
        Utils.writeValue("/sys/module/msm_ts/parameters/tscal_gesture_pressure", Integer.parseInt(prefs.getString("gesture_pressure", "1200")));
        Utils.writeValue("/sys/module/msm_ts/parameters/tscal_gesture_blindspot", Integer.parseInt(prefs.getString("gesture_blindspot", "100")));

        // USB charging
        if(prefs.getBoolean("usb_charging", true))
            Utils.writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 1);
        else
            Utils.writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 0);
    }
}

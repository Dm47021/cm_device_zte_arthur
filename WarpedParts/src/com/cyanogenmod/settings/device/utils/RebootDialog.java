package com.cyanogenmod.settings.device.utils;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.PowerManager;
import android.util.Log;

import com.cyanogenmod.settings.device.DeviceSettings;

public class RebootDialog extends DialogFragment
{
    private static final String TAG = "WarpedParts";

    Context mContext;
    
    public RebootDialog(Context mContext){
        this.mContext = mContext;
    }
    
    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState){
        String s = "CAUTION!!!";
        String t = "Changing this option requires a full reboot. Reboot now?";
        String y = "Reboot Now";
        String n = "Not Now";
        String c = "Cancel";
        
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
    
        builder.setMessage(t)
               .setTitle(s);
               
        builder.setPositiveButton(y, new DialogInterface.OnClickListener() {
           public void onClick(DialogInterface dialog, int id) {
               PowerManager powerManager = (PowerManager) mContext.getSystemService(Context.POWER_SERVICE);
               powerManager.reboot(null);
           }
       });
        builder.setNegativeButton(c, new DialogInterface.OnClickListener() {
           public void onClick(DialogInterface dialog, int id) {
               if(android.os.SystemProperties.get(debug.sf.hw) == 0){
                        android.os.SystemProperties.set(debug.sf.hw, 1);
                        cb.setChecked(true);
                    }
                else
                    if(android.os.SystemProperties.get(debug.sf.hw) == 1){
                        android.os.SystemProperties.set(debug.sf.hw, 0);
                        cb.setChecked(false);
                    }
           }
       });
        builder.setNeutralButton(c, new DialogInterface.OnClickListener() {
           public void onClick(DialogInterface dialog, int id) {
               dialog.dismiss();
           }
       });
       


        return builder.create();
}
}

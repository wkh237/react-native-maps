package com.airbnb.android.react.maps;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReadableArray;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.GroundOverlay;
import com.google.android.gms.maps.model.GroundOverlayOptions;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

/**
 * Created by Ben Hsieh on 2016/11/1.
 */

public class AirMapGroundOverlay extends AirMapFeature{

    private String url;
    private ReadableArray coordinates;
    private GroundOverlay mOverlay ;
    ReactContext mCtx;
    LatLngBounds mBounds;

    public AirMapGroundOverlay(ReactContext context) {
        super(context);
        mCtx = context;
    }

    @Override
    public void addToMap(final GoogleMap map) {

        try {
            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {

                    Bitmap bitmap = null;
                    try {
                        bitmap = BitmapFactory.decodeStream((InputStream)new URL(url).getContent());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    final Bitmap finalBitmap = bitmap;
                    mCtx.runOnUiQueueThread(new Runnable() {
                        @Override
                        public void run() {
                            GroundOverlayOptions overlay = new GroundOverlayOptions()
                                    .image(BitmapDescriptorFactory.fromBitmap(finalBitmap))
                                    .positionFromBounds(mBounds);
                            mOverlay = map.addGroundOverlay(overlay);
                        }
                    });

                }
            });
            thread.start();

        } catch (Exception e) {
            return ;
        }

    }

    @Override
    public void removeFromMap(GoogleMap map) {
        if(mOverlay != null) {
            mOverlay.remove();
        }
    }

    @Override
    public Object getFeature() {
        return null;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setCoordinates(ReadableArray coordinates) {

        this.coordinates = coordinates;
        mBounds = new LatLngBounds(
                new LatLng(coordinates.getMap(0).getDouble("latitude"), coordinates.getMap(0).getDouble("longitude")),       // South west corner
                new LatLng(coordinates.getMap(1).getDouble("latitude"), coordinates.getMap(1).getDouble("longitude"))
        );      // North east corner
    }
}

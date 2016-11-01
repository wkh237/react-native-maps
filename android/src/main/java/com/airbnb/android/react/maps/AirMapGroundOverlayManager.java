package com.airbnb.android.react.maps;

import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewGroupManager;
import com.facebook.react.uimanager.annotations.ReactProp;

/**
 * Created by Ben Hsieh on 2016/11/1.
 */

public class AirMapGroundOverlayManager extends ViewGroupManager<AirMapGroundOverlay> {

    AirMapGroundOverlay mView;

    AirMapGroundOverlayManager(ReactContext ctx) {

    }

    @Override
    public String getName() {
        return "AIRMapGroundOverlay";
    }

    @Override
    protected AirMapGroundOverlay createViewInstance(ThemedReactContext reactContext) {
        mView = new AirMapGroundOverlay(reactContext);
        return mView;
    }

    @ReactProp(name = "url")
    public void setUrl(AirMapGroundOverlay view, String url) {
        view.setUrl(url);
    }

    @ReactProp(name = "coordinates")
    public void setCoordinates(AirMapGroundOverlay view, ReadableArray coordinates) {
        view.setCoordinates(coordinates);
    }


}

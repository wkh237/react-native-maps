import React, { PropTypes } from 'react';
import {
  View,
  requireNativeComponent,
} from 'react-native';

const propTypes = {
  ...View.propTypes,

  /**
   * The URL of ground overlay image.
   */
  url: PropTypes.string.isRequired,

  /**
   * The order in which this tile overlay is drawn with respect to other overlays. An overlay
   * with a larger z-index is drawn over overlays with smaller z-indices. The order of overlays
   * with the same z-index is arbitrary. The default zIndex is -1.
   *
   * @platform android
   */
  zIndex: PropTypes.number,

  /**
   * An array of coordinates to describe the polygon
   */
  coordinates: PropTypes.arrayOf(PropTypes.shape({
    /**
     * Latitude/Longitude coordinates
     */
    latitude: PropTypes.number.isRequired,
    longitude: PropTypes.number.isRequired,
  })),

};

class MapGroundOverlay extends React.Component {
  render() {
    return (
      <AIRGroundOverlay
        {...this.props}
      />
    );
  }
}

MapGroundOverlay.propTypes = propTypes;

const AIRGroundOverlay = requireNativeComponent('AIRMapGroundOverlay', MapGroundOverlay);

module.exports = AIRGroundOverlay;

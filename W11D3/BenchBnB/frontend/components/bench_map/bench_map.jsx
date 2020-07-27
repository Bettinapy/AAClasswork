import React from 'react';
import MarkerManager from '../../util/marker_manager';
class BenchMap extends React.Component {
    componentDidMount() {
        // set the map to show SF
        const mapOptions = {
            center: { lat: 37.7758, lng: -122.435 }, // this is SF
            zoom: 13
        };
        debugger
        // wrap this.mapNode in a Google Map
        // this.mapNode is the html element where the map is located in
        this.map = new google.maps.Map(this.mapNode, mapOptions);
        this.MarkerManager = new MarkerManager(this.map);
        this.MarkerManager.updateMarkers()
    }

    render() {
        return (
            <div id="map-container" ref={map => this.mapNode = map} />

        
        )
    }
}

export default BenchMap;
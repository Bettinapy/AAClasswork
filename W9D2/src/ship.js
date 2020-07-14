const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");

const DEFAULTS = {
    COLOR: 'red',
    RADIUS: 25
}


function Ship(options){
    options.color = DEFAULTS.COLOR;
    options.radius = DEFAULTS.RADIUS;
    options.vel = [0,0];
    MovingObject.call(this, options);
}
Ship.prototype.relocate = function(){
    this.pos = this.game.randomPosition();
    this.vel = [0,0];
}
Util.inherits(Ship, MovingObject);
module.exports = Ship;
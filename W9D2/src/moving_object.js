const Util = require("./utils.js")

function MovingObject(obj){
    this.pos = obj.pos;
    this.vel = obj.vel;
    this.radius = obj.radius;
    this.color = obj.color;
    this.game = obj.game;
}

MovingObject.prototype.draw = function(ctx){
    // draw red circle
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
    ctx.strokeStyle = this.color;
    ctx.stroke();
}

MovingObject.prototype.move = function() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.pos = this.game.wrap(this.pos);
}

MovingObject.prototype.isCollidedWith = function(otherObject){
    function dist([x_1, y_1], [x_2, y_2]) {
        return Math.sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)
    } 
    let distance = dist(this.pos, otherObject.pos);
    let sumOfRadii = this.radius + otherObject.radius
    if(distance < sumOfRadii){
        return true
    }else{
        return false
    }
}

MovingObject.prototype.collideWith = function(otherObject){

}
 

module.exports = MovingObject;
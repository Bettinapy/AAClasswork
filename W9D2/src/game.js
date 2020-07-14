const Asteroid = require('./asteroid.js')
const Util = require('./utils.js')
const Ship = require('./ship.js')

const DIM_X = 1000;
const DIM_Y = 600;
const NUM_ASTEROIDS = 4;

function Game(){
    this.asteroids = [];
    this.addAsteroids();
    this.ship = new Ship({pos: this.randomPos(), game: this});
}

Game.prototype.addAsteroids = function(){
    for(let i = 0; i < NUM_ASTEROIDS; i++){
        let randomPos = this.randomPos();
        this.asteroids.push(new Asteroid({pos: randomPos, game: this}))
    }
}

Game.prototype.randomPos = function() {
    let randPos = [Math.random() * DIM_X, Math.random() * DIM_Y];
    return randPos;
}

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, DIM_X, DIM_Y);
    //ctx.fillStyle = "#0000FF"
    // ctx.fillRect(0, 0, DIM_X, DIM_Y);
    this.allObjects().forEach(asteroid => {
        asteroid.draw(ctx);
    });
};

Game.prototype.moveObjects = function(){
    debugger
    this.allObjects().forEach(asteroid => {
        asteroid.move();
    })
}

Game.prototype.wrap = function(pos){
    return [Util.wrap(pos[0], DIM_X), Util.wrap(pos[1], DIM_Y)];
};

Game.prototype.checkCollisions = function(){
    debugger
    for (let i = 0; i < this.allObjects().length; i++){
        for (let j = i + 1; j < this.allObjects().length; j++){
            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])){
                return alert("COLLISION");
            }
        }
    }
}

Game.prototype.step = function(){
    this.moveObjects();
    this.checkCollisions();
}

Game.prototype.remove = function(asteroid){
    let idx = this.asteroids.indexOf(asteroid);
    if (idx !== -1){
        this.asteroids.splice(idx,1)
    }
}

Game.prototype.allObjects = function(){
    let all = this.asteroids.concat([this.ship]);
    return all;
}

module.exports = Game;
import {htmlGenerator} from "./warmup.js";

class Clock{
    constructor(){
        const currentTime = new Date();

        this.hours = currentTime.getHours();
        this.minutes = currentTime.getMinutes();
        this.seconds = currentTime.getSeconds();

        htmlGenerator(this.printTime(),clockEle);
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        // Format the time in HH:MM:SS
        const timeString = [this.hours, this.minutes, this.seconds].join(":");

        // Use console.log to print it.
        return timeString;
    }

    _tick() {
        // 1. Increment the time by one second.
        this._incrementSeconds();

        // 2. Call printTime.
        htmlGenerator(this.printTime(), clockEle);
    }

    _incrementSeconds() {
        // 1. Increment the time by one second.
        this.seconds += 1;
        if (this.seconds === 60) {
            this.seconds = 0;
            this._incrementMinutes();
        }
    }

    _incrementMinutes() {
        this.minutes += 1;
        if (this.minutes === 60) {
            this.minutes = 0;
            this._incrementHours();
        }
    }

    _incrementHours() {
        this.hours = (this.hours + 1) % 24;
    }

}

const clockEle = document.getElementById("clock");
const clock = new Clock();
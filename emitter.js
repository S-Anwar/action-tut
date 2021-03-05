
const EventEmitter = require('events');

class Car extends EventEmitter{
    engine(msg)
    {
        console.log(msg);
        
        this.emit('Working', {vin:'ka1395bs', model:'V8 Turbo'})
    }
}

module.exports=Car;
// import './emitter.js';


const EventEmitter = require('events');

const data= require('./emitter.js');

const obj= new data();

obj.on('Working', (args)=> {
    console.log('Event is listened and data sent is:',args);
    // test('Automated Test Successful', ()=>{
    //     expect(args).toBe( {vin:'ka1395bs', model:'V8 Turbo'})
    // })
})

obj.engine('Listening to data sent by emitter.js');
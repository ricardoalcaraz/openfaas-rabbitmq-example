'use strict'

var amqp = require('amqplib/callback_api');


module.exports = (context, callback) => {
  const nc = NATS.connect({ url: NATS_URL, user: NATS_USER, pass: NATS_PASS })
  wait(WAIT);
  nc.on('connect', () => {
    nc.on('error', (err) => {
      console.log(err)
    })
    nc.publish(NATS_TOPIC, context || 'Hello World!!')
    
    nc.flush(function () {
      nc.close()
    })
  })
  
  callback(undefined, {status: context})
}

function wait(ms)
{
    var d = new Date();
    var d2 = null;
    do { d2 = new Date(); }
    while(d2-d < ms);
}
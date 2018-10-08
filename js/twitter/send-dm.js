'use strict'

const http = require('http');

let endPoint = "https://api.twitter.com/1.1/direct_messages/events/new.json"

let postData = {
    "event": {
        "type": "message_create",
        "message_create": {
            "target": {
                "recipient_id": "RECIPIENT_USER_ID"
            },
            "message_data": {
                "text": "Hello World!"
            }
        }
    }
}


let postDataStr = JSON.stringify(postData);
let options = {
    path: endPoint,
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'Content-Length': postDataStr.length
    }
};

let req = http.request(options, (res) => {
    console.log('STATUS: ' + res.statusCode);
    console.log('HEADERS: ' + JSON.stringify(res.headers));
    res.setEncoding('utf8');
    res.on('data', (chunk) => {
        console.log('BODY: ' + chunk);
    });
});
req.on('error', (e) => {
    console.log('problem with request: ' + e.message);
});
req.write(postDataStr);
req.end();
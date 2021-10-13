const express = require('express')
const app = express();
const url = require('url'); // to parse url
const https = require('https');// to send https requests 
const mongoClient = require('mongodb').MongoClient
// initialize geolocation api base url
const rapidAPIBaseUrl = "https://rapidapi.p.rapidapi.com/json/?ip=";

// create basic server and implement handling different requests
app.listen(4000,function(){
    initialize();
    console.log("The app running on http://localhost:4000");
})

function initialize(){
   
    app.get('/api/ipmon/ip/show',function(req,res){
        console.log("in GET /api/ipmon/ip/show");
        handleShow(res); 
    });
                              
}


/* function to handle show*/
function handleShow(res){
    // set the header and status
    res.setHeader('content-type', 'Application/json');
    res.statusCode = 200;
    // create an array from the map 
    var returnObject = {
        firstName: 'testFirstName',
        lastName: 'testLastName'
      };

    res.send(JSON.stringify(returnObject));
}

import express, {Request,Response,Application} from 'express';
const app:Application = express();
const PORT = process.env.PORT || 4000;

app.get("/", (request:Request, response:Response):void => {
  response.send("It works version:0.0.1")
});

app.get("/students", (request:Request, response:Response):void => {
  handleGet(response)
});

app.listen(PORT, ():void => {
  console.log(`Server Running here 👉 http://localhost:${PORT}`);
});  

/* function to handle show*/
function handleGet(response:Response){
    // set the header and status
    response.setHeader('content-type', 'Application/json');
    response.statusCode = 200;
    // create an array from the map 
    var returnObject = {
        firstName: 'testFirstName',
        lastName: 'testLastName'
      };

    response.send(JSON.stringify(returnObject));
}
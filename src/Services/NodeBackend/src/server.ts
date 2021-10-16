import express, {Request,Response,Application} from 'express';
import { sendSuccessRequest } from "./common";
const bodyParser = require('body-parser');
const cors = require('cors');
const app:Application = express();
const PORT = process.env.PORT || 4000;
let students = [
  { id: '1', name: 'Vu', email: 'Le@yahoo.com'},
  { id: '2', name: 'Minh', email: 'Hoang@yahoo.com'}
];


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(cors());

// Run app on port
app.listen(PORT, ():void => {
  console.log(`Server Running here 👉 http://localhost:${PORT}`);
});  

// Define routing
app.get("/", (req:Request, res:Response):void => {handleHealthCheck(req,res)});
app.get("/students", (req:Request, res:Response):void => {handleGetList(req, res)});
app.get("/students/:id", (req:Request, res:Response):void => {handleGetItem(req, res)});
app.put("/students/:id", (req:Request, res:Response):void => {handlePutItem(req, res)});
app.post("/students", (req:Request, res:Response):void => {handlePostItem(req, res)});
app.delete("/students/:id", (req:Request, res:Response):void => {handleDeleteItem(req, res)});

function handleHealthCheck(req:Request, res:Response){
  res.send("It works v0.0.1");
}

function handleGetList(req:Request, res:Response){
  sendSuccessRequest(res, students);
}

function handleGetItem(req:Request, res:Response){
  // Find item in an array  
  let id = req.params.id;
  let candidate = students.find(student => student.id === id );

  // set the header and status
  sendSuccessRequest(res, candidate);
}

function handlePutItem(req:Request, res:Response){
  // Find item in an array  
  let id = req.params.id;
  let candidate = students.find(student => student.id === id );

  // Update values
  var putObject = req.body;
  candidate.email = putObject.email;
  candidate.name = putObject.name;

  // set the header and status
  sendSuccessRequest(res, candidate);
}

function handlePostItem(req:Request, res:Response){
  //Validate whether it is exists
  let id = req.params.id;
  let candidate = students.find(student => student.id === id );
  if(candidate)
  {
    students.push(req.body);
  }
  else
  {
    // Update values
    var putObject = req.body;
    candidate.email = putObject.email;
    candidate.name = putObject.name;
  }

  // set the header and status
  sendSuccessRequest(res, req.body);
}

function handleDeleteItem(req:Request, res:Response){
  //Validate whether it is exists
  let id = req.params.id;
  var candidateIndex = students.findIndex(x=>x.id === id)
  var deletedStudent = students.splice(candidateIndex)

  // set the header and status
  sendSuccessRequest(res, deletedStudent);

}
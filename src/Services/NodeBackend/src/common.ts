import express, {Request,Response,Application} from 'express';


export function sendSuccessRequest(res:Response, responseObject){
    res.setHeader('content-type', 'Application/json');
    res.statusCode = 200;
  
    res.send(JSON.stringify(responseObject));
  }


import express from 'express';
import * as dotenv from 'dotenv';
import cors from 'cors';
import bodyParser from 'body-parser';
import './api/models/index.js';
import './api/models/category.model.js'
import baseRouter from './api/routes/index.js';

dotenv.config();

const app = express();
const port = process.env.SERVER_PORT || 5000;

//Middleware
app.use(cors());
app.use(bodyParser.urlencoded());
app.use(bodyParser.json());

//API route
app.use("/api",baseRouter)

app.listen(port,() => {
    console.log("App listening on port " + port);
})




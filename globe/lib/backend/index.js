const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./jsbackens/auth");
const adminRouter = require("./jsbackens/adminbackend/admin");
const sponshorRouter = require("./jsbackens/sponsher/sponshorrequirement");
const Firmrouter = require("./jsbackens/firm");
const PORT = 5444;

//=====mongoose connection====//

mongoose.set("strictQuery" , false);


mongoose.connect("mongodb+srv://Void:Void0000@cluster0.7lkmrmi.mongodb.net/?retryWrites=true&w=majority").then(()=>{
    console.log("connected successfully ");
}).catch((e)=>{
    console.log(e);
});


//initiallizing
const app = express();


//middlewares
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(sponshorRouter);
app.use(Firmrouter);



//starting The Server

app.listen(PORT , ()=>{
    console.log(`Server is starting at ${PORT}`);
    
})



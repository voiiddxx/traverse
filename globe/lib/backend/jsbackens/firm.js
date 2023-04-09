const express = require("express");
const Firm = require("./sponsher/firmmodel");

const Firmrouter = express.Router();

Firmrouter.post("/hire" , async(req,res)=>{
    const name = req.body.name;
    const email = req.body.email;
    const mobilenumber = req.body.mobilenumber;
    const product = req.body.product;
    const productcategory = req.body.productcategory;

    let firm = new Firm({
        name,
        email,
        mobilenumber,
        product,
        productcategory
    });

    firm.save().then(()=>{
        console.log("Saved With" , firm);
        res.send(firm);
    }).catch((e)=>[
        res.status(400).send(firm)
    ]);
}) 

Firmrouter.get("/get" ,async (req,res)=>{
    const data = await Firm.find({});

    if(data){
        res.send(data);
    }
    else{
        res.status(500).send("Not Working Now");
        
    }
})
module.exports = Firmrouter;

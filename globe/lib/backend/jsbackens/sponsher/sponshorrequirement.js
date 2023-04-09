const express = require("express");
const Requirment = require("../../models/jsmodel/sponshormodel");

const sponshorRouter = express.Router();


sponshorRouter.post("/add-requirement" ,async (req,res)=>{
    const organizationname = req.body.organizationname;
    const eventname = req.body.eventname;
    const eventdate = req.body.eventdate;
    const address = req.body.address;
    const description = req.body.description;
    const audince = req.body.audince;

    const requirement = new Requirment({
        organizationname,
        eventname,
        eventdate,
        address,
        description,
        audince,

    });

    requirement.save().then(()=>{
        res.send(requirement);
        console.log(requirement);
    }).catch((e)=>{
        console.log(e);
        res.status(500).send(e);
    })
});

sponshorRouter.get("/get-sponsher" ,async (req,res)=>{
    const allsponsher = await Requirment.find({});

    if(allsponsher){
        console.log(allsponsher);
        res.send(allsponsher);
    }
    else{
        console.log("Some Error");
        res.status(500).send("Some Error");
    }
})

module.exports = sponshorRouter;

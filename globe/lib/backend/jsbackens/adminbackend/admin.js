const express = require("express");
const Agency = require("../../models/jsmodel/agencymodel");

const adminRouter = express.Router();

//=========upload Agency route===============//

adminRouter.post("/upload-agency" , (req,res)=>{
    const agencyname = req.body.agencyname;

    const registrationnumber = req.body.registrationnumber;
    const agencyspan = req.body.agencyspan;
    const agencyaddress = req.body.agencyaddress;
    const agencyimage = req.body.agencyimage;
    const remarkablework = req.body.remarkablework;


    
        let agency = new Agency({
          registrationnumber,
          agencyname,
          agencyspan,
          agencyaddress,
          remarkablework
        });
        agency.save().then(()=>{
            console.log("Agency Saved With This Details" , agency);
            res.send(agency);

        }).catch((e)=>{
            console.log(e);
            res.status(500).send(e);
    });
        
    
});


//==========Get All Agency Details===========//
adminRouter.get("/get-agency" , async (req,res)=>{
    const getagency = await Agency.find({});

    if(getagency){
        console.log(getagency);
        res.send(getagency);
    }
    else{
        console.log("No Agencies Founded");
        res.status(500).send("No Agency Founded");
        
    }
})





module.exports = adminRouter;



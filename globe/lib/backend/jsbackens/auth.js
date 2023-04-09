const express = require("express");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const Register = require("../models/jsmodel/register");



const authRouter = express.Router();

//========Register Route==========//
authRouter.post("/register" ,async (req,res)=>{
    const username = req.body.username;
    const email = req.body.email;
    const password = req.body.password;
    const confirmpassword = req.body.confirmpassword;

    const ExistingUser = await Register.findOne({email});

    if(ExistingUser){

        console.log("User Not exist With This Email Address");
        res.status(400).send("try With Another Email Address");

    }
    else{

        if(password==confirmpassword){
            const hashedpassword = await bcrypt.hash(password , 10);
            const securehashedpassword = await bcrypt.hash(confirmpassword , 10);
            

            let registeruser = new Register({
                'username':req.body.username,
                'email':req.body.email,
                'password':hashedpassword,
                'confirmpassword':securehashedpassword
    
            });
    
            registeruser.save().then(()=>{
                console.log("User Saved With" , registeruser);
                res.json(registeruser);
    
            }).catch((e)=>{
                console.log(e);
                res.status(500).send(e);
    
            });
        }
        else{
            console.log("try Correct Password");
            res.status(400).send("Inavlid Password");

        }

    }
});




//======login router=====/
authRouter.post("/login" , async(req,res)=>{
    const email = req.body.email;
    const password = req.body.password;

    const Exist = await Register.findOne({email});

    if(Exist){
        const isMatch = await bcrypt.compare(password , Exist.password);

        if(isMatch){

            const token = await jwt.sign({id: Exist._id} , "passwordkey");
            console.log("User Login With Correct Email And Password" ,token , Exist);

            res.send({token , ...Exist._doc});

        }
        else{
            console.log("Invalid Password");
            res.status(400).send("Try Another Password");

        }
    }
    else{
        console.log("User Not Exist, SignUp Now!");
        res.status(400).send("User Not Exist, SignUp Now!")
    }
    
})

authRouter.get("/get-all" , (req,res)=>{
    res.send("Working")

});


module.exports = authRouter;
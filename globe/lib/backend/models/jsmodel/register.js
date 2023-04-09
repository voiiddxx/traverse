const mongoose = require("mongoose");

const registerSchema = mongoose.Schema({
    username:{
        type: String,
        
    },
    email:{
        type:String,
    },
    password:{
        type:String,
    },
    confirmpassword:{
        type:String,
    }
});

const Register = mongoose.model("Register" , registerSchema);

module.exports = Register;

const mongoose = require("mongoose");

const firmSchema = mongoose.Schema({
    name:{
        type:String
    },
    email:{
        type:String
    },
    mobilenumber:{
        type:String
    },
    product:{
        type:String
    },
    productcategory:{
        type:String
    },
   
});

const Firm = mongoose.model("firm" , firmSchema);
module.exports = Firm;

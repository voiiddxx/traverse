const mongoose = require("mongoose");

const uploadagencySchema = mongoose.Schema({
    agencyname:{
        type:String
    },
    registrationnumber:{
        type:String
    },
    agencyspan:{
        type:String
    },
    agencyaddress:{
        type:String
    },
    remarkablework:{
        type:String
    },
   
});

const Agency = mongoose.model("Agency" , uploadagencySchema);

module.exports = Agency;

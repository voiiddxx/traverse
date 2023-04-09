const mongoose = require("mongoose");

const sponshorSchema = mongoose.Schema({
    organizationname:{
        type: String,
    },
    eventname:{
        type: String,
    },
    
    eventdate:{
        type: String,
    },
    address:{
        type: String,
    },
    description:{
        type:String
    },
    audince:{
        type:String,
    }
    
});

const Requirment = mongoose.model("Requirement" , sponshorSchema);

module.exports = Requirment;

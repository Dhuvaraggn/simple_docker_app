const express = require("express")
const app =express();
app.get("/",(req,res)=>{
    res.send("welcome to ajith jenkins & codebuild image deployedd")
})
app.listen(8000,"0.0.0.0");
console.log("application started on port 8000")

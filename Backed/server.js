const express = require("express");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const mongoose = require("mongoose");
const passportConfig = require("./lib/passportConfig");
const cors = require("cors");
const fs = require("fs");

// MongoDB
mongoose
  .connect("mongodb+srv://mahad:mahad123456@cluster0.quftj.mongodb.net/B2B-App?retryWrites=true&w=majority", {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useCreateIndex: true,
    useFindAndModify: false,
  })
  .then((res) => console.log("Connected to DB"))
  .catch((err) => console.log(err));

// initialising directories
if (!fs.existsSync("./public")) {
  fs.mkdirSync("./public");
}
if (!fs.existsSync("./public/resume")) {
  fs.mkdirSync("./public/resume");
}
if (!fs.existsSync("./public/profile")) {
  fs.mkdirSync("./public/profile");
}

const app = express();
const port = 3000;

app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies
app.use(express.urlencoded({extended:true}));

// Setting up middlewares
app.use(cors());
app.use(express.json());
app.use(passportConfig.initialize());
app.use(cookieParser());

// Routing
app.use("/auth", require("./routes/authRoutes"));
app.use("/api", require("./routes/sellerRoutes"));
app.use("/api", require("./routes/buyerRoutes"));
//app.use("/upload", require("./routes/uploadRoutes"));
//app.use("/host", require("./routes/downloadRoutes"));

app.listen(port, () => {
  console.log(`Server started on port ${port}!`);
});

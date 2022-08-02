const express = require("express");
const mongoose = require("mongoose");
const jwtAuth = require("../lib/jwtAuth");

const User = require("../db/User");
const Buyer = require("../db/Buyer");
const Seller = require("../db/Seller");
const SellerDetails = require("../db/SellerDetails")
const { JsonWebTokenError } = require("jsonwebtoken");

const router = express.Router();

router.get('/readAllSellerDetails', async (req, res) => {
    try {
        const abc = await SellerDetails.find();
        res.json(abc)
    } catch (err) {
        res.json({ message: err })
    }
})

module.exports = router;
const express = require("express");
const mongoose = require("mongoose");
const jwtAuth = require("../lib/jwtAuth");

const User = require("../db/User");
const Buyer = require("../db/Buyer");
const Seller = require("../db/Seller");
const SellerDetails = require("../db/SellerDetails")
const { JsonWebTokenError } = require("jsonwebtoken");

const router = express.Router();

// to create all details from Sellers
router.post('/save/sellerDetails', async (req, res) => {
    try {
        const saveDetail = await SellerDetails.create(req.body)
        res.json(saveDetail);
    } catch (err) {
        res.json({ message: err })
    }
})

// Get saved detils
router.get('/read/:Rid',async(req,res)=>{
    console.log(req.params,req.body)
    try{
       const abc = await SellerDetails.findById(req.params.Rid)
       res.json(abc)
    }catch(err){
       res.json({message:err})
    }
 })

// DELETING
router.delete('/delete/:Did', async (req, res) => {
    try {
        const removeDetails = await SellerDetails.remove({ _id: req.params.Did })
        res.json(removeDetails)
    } catch (err) {
        res.json({ message: err })
    }
})

// UPDATING
router.patch('/update/:Uid', async (req, res) => {
    try {
        const updatedDetails = await SellerDetails.findByIdAndUpdate(req.params.Uid, {
            name: req.body.name,
            contactNumber: req.body.contactNumber,
            location: req.body.location,
            weight: req.body.weight,
            aomuntOfMasses: req.body.aomuntOfMasses,
            typeOfRice: req.body.typeOfRice,
            pricePerMasss: req.body.pricePerMasss
        },
        {
            new: true,
            runValidators: true
        })
        res.json(updatedDetails);
    } catch (err) {
        res.json({ message: err })
    }
})

module.exports = router;
const express = require("express");
const passport = require("passport");
const jwt = require("jsonwebtoken");
const authKeys = require("../lib/authKeys");
const mongoose = require("mongoose");
const jwtAuth = require("../lib/jwtAuth");

const User = require("../db/User");
const Buyer = require("../db/Buyer");
const Seller = require("../db/Seller");

const router = express.Router();

router.post("/signup", (req, res) => {
  const data = req.body;
  let user = new User({
    email: data.email,
    password: data.password,
    type: data.type,
  });

  user
    .save()
    .then(() => {
      const userDetails =
        user.type == "seller"
          ? new Seller({
            userId: user._id,
            name: data.name,
            contactNumber: data.contactNumber,
          })
          : new Buyer({
            userId: user._id,
            name: data.name,
            contactNumber: data.contactNumber,
          });

      userDetails
        .save()
        .then(() => {
          // Token
          const token = jwt.sign({ _id: user._id }, authKeys.jwtSecretKey);
          res.cookie('access-token', token, {
            maxAge: 60 * 60 * 24 * 30 * 100,
            httpOnly: true,
            secure: true,
          })
          res.json({
            // token: token,
            type: user.type,
          });
        })
        .catch((err) => {
          user
            .delete()
            .then(() => {
              res.status(400).json(err);
            })
            .catch((err) => {
              res.json({ error: err });
            });
          err;
        });
    })
    .catch((err) => {
      res.status(400).json(err);
    });
});


router.post("/login", (req, res, next) => {
  passport.authenticate(
    "local",
    { session: false },
    function (err, user, info) {
      if (err) {
        return next(err);
      }
      if (!user) {
        res.status(401).json(info);
        return;
      }
      // Token
      const token = jwt.sign({ _id: user._id }, authKeys.jwtSecretKey);
      res.cookie('access-token', token, {
        maxAge: 60 * 60 * 24 * 30 * 100,
        httpOnly: true,
        // secure: true,
      })
      res.json({
        // token: token,
        type: user.type,
      });
    }
  )(req, res, next);
});

module.exports = router;

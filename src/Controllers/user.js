// const productModel = require('../Models/product');
const userModel = require("../Models/user");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");

const verifyAdmin = (req, res) => {
  const token = req.headers.authorization;
  var atob = require("atob");
  var base64Url = token.split(".")[1];
  var base64 = base64Url.replace(/-/g, "+").replace(/_/g, "/");
  var jsonPayload = decodeURIComponent(
    atob(base64)
      .split("")
      .map(function(c) {
        return "%" + ("00" + c.charCodeAt(0).toString(16)).slice(-2);
      })
      .join("")
  );
  const userProfile = JSON.parse(jsonPayload);
  console.log("bukan admin ?", userProfile.response.role !== "admin"); // console.log("token", token);
  console.log("role yg login", userProfile.response.role);
  if (userProfile.response.role !== "admin") {
    return res.sendStatus(403);
  }
};

const validateEmail = em => {
  const regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  return regex.test(em);
};

module.exports = {
  getUserByEmail: (req, res) => {
    const { email } = req.body;
    userModel
      .getUserByEmail(email)
      .then(result => res.json(result))
      .catch(err => res.json(err));
  },

  loginUser: async (req, res, next) => {
    try {
      const { email, password } = req.body;

      if (email == null || email == undefined) {
        res.status(400).json({ msg: "Email Cannot Empty" });
      } else if (!validateEmail(email)) {
        res.status(400).json({ msg: "Email is Invalid" });
      } else if (password == null || password == undefined) {
        res.status(400).json({ msg: "Password Cannot Empty" });
      } else {
        await userModel
          .loginUser(email)
          .then(response => {
            if (response.length === 0) {
              res.status(400).json({
                message: `User with email ${email} Not Found`
              });
            } else {
              if (bcrypt.compareSync(password, response[0].password)) {
                let token = jwt.sign(
                  { response: response[0] }, //level: "user"
                  process.env.SECRET_KEY,
                  { expiresIn: "60m" }
                );
                res.json({
                  sucess: true,
                  err: null,
                  token
                });
                // res.send(token);
                console.log({ msg: "berhasil login" });
              } else {
                res.status(400).json({
                  message: "Wrong password or Email"
                });
              }
            }
          })
          .catch(err => {
            res.json(err);
          });
      }
    } catch (err) {
      next(err);
    }
  },
  registerUser: async (req, res, next) => {
    try {
      const { name, email, password } = req.body;
      const userData = {
        name,
        email,
        password,
        role: "user"
      };

      if (email == null || email == undefined) {
        res.status(400).json({ msg: "Email is Required" });
      } else if (name == null || name == undefined) {
        res.status(400).json({ msg: "Name is Required" });
      } else if (!validateEmail(email)) {
        res.status(400).json({ msg: "Email is Invalid" });
      } else if (password == null || password == undefined) {
        res.status(400).json({ msg: "Password Cannot Empty" });
      } else if (password.length < 5) {
        res.status(400).json({ msg: "Password Should be greater than 5" });
      } else {
        await userModel
          .getUserByEmail(email)
          .then(result => {
            if (result.length > 0) {
              res.status(400).json({ msg: "Email already exists" });
            } else {
              bcrypt.hash(password, 10, (err, hash) => {
                userData.password = hash;
                userModel
                  .registerUser(userData)
                  .then(result => {
                    res.json({ msg: "Succes Register user" });
                  })
                  .catch(err => {
                    res.json(err);
                  });
              });
            }
          })
          .catch(err => {
            res.json(err);
          });
      }
    } catch (err) {
      next(err);
    }
  },

  addAdmin: async (req, res, next) => {
    verifyAdmin(req, res);
    try {
      const { name, email, password } = req.body;
      const userData = {
        name,
        email,
        password,
        role: "admin"
      };

      if (email == null || email == undefined) {
        res.status(400).json({ msg: "Email is Required" });
      } else if (name == null || name == undefined) {
        res.status(400).json({ msg: "Name is Required" });
      } else if (!validateEmail(email)) {
        res.status(400).json({ msg: "Email is Invalid" });
      } else if (password == null || password == undefined) {
        res.status(400).json({ msg: "Password Cannot Empty" });
      } else if (password.length < 5) {
        res.status(400).json({ msg: "Password Should be greater than 5" });
      } else {
        await userModel
          .getUserByEmail(email)
          .then(result => {
            if (result.length > 0) {
              res.status(400).json({ msg: "Email already exists" });
            } else {
              bcrypt.hash(password, 10, (err, hash) => {
                userData.password = hash;
                userModel
                  .registerUser(userData)
                  .then(result => {
                    res.json({ msg: "Succes Register user" });
                  })
                  .catch(err => {
                    res.json(err);
                  });
              });
            }
          })
          .catch(err => {
            res.json(err);
          });
      }
    } catch (err) {
      next(err);
    }
  }

  // @route GET
  // getUserOrder: (req, res, next) => {
  //   jwt.verify(req.token, process.env.SECRET_KEY, async (err, data) => {
  //     if (err) {
  //       res.sendStatus(403);
  //     } else {
  //       const { user_id } = data.response;

  //       let rslt = {};
  //       let total = {};

  //       try {
  //         await userModel
  //           .getUserCartOrder(user_id)
  //           .then(async result => {
  //             if (result.length === 0) {
  //               res.status(404).json({
  //                 msg: "Order is empty"
  //               });
  //             } else {
  //               rslt = result;
  //               await userModel
  //                 .getGrandTotal(user_id)
  //                 .then(grand => {
  //                   if (result.length === 0) {
  //                     res.status(404).json({
  //                       msg: "Order is empty"
  //                     });
  //                   } else {
  //                     total = grand[0];
  //                   }
  //                 })
  //                 .catch(err => {
  //                   res.json(err);
  //                 });
  //             }
  //           })
  //           .catch(err => {
  //             res.json(err);
  //           });

  //         let finalResult = {
  //           result: rslt,
  //           total: total.Grand
  //         };
  //         res.json(finalResult);
  //       } catch (error) {
  //         next(err);
  //       }
  //     }
  //   });
  // }
};

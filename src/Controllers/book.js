const bookModel = require("../Models/book");
const formRes = require("../Helpers/formRes");
// const upload = require("../Configs/multer");
// const cloudinary = require("../Configs/cloudinary");

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

module.exports = {
  showAllBook: (req, res) => {
    // const bookGenre = req.query.genre
    bookModel
      .showAllBook()
      .then(response => formRes.showAllBook1(res, response, 200))
      .catch(err => console.log(err));
  },
  popularBook: (req, res) => {
    // const bookGenre = req.query.genre
    bookModel

      .popularBook()
      .then(response => formRes.showAllBook1(res, response, 200))
      .catch(err => console.log(err));
  },
  detailBook: (req, res) => {
    const bookDetail = req.query.id;
    bookModel
      .detailBook(bookDetail)
      .then(response => formRes.detailBook1(res, response, 200))
      .catch(err => console.log(err));
  },
  searchBook: (req, res) => {
    const bookSearch = req.query.title;
    bookModel
      .searchBook(bookSearch)
      .then(response => formRes.searchBook1(res, response, 200))
      .catch(err => console.log(err));
  },
  filterGenre: (req, res) => {
    const bookGenre = req.query.genre;
    bookModel
      .filterGenre(bookGenre)
      .then(response => formRes.filterGenre1(res, response, 200))
      .catch(err => console.log(err));
  },
  filterStatus: (req, res) => {
    const bookStatus = req.query.status;
    bookModel
      .filterStatus(bookStatus)
      .then(response => formRes.filterStatus1(res, response, 200))
      .catch(err => console.log(err));
  },

  // WITH IMAGE
  // addBook: (req, res) => {
  //   //  const bodyReq = req.body;
  //   var date = new Date();
  //   upload.single("url_img")(req, res, async err => {
  //     if (err) {
  //       res.json({ msg: err });
  //     } else {
  //       if (req.file == undefined) {
  //         res.json({
  //           msg: "No File Selected"
  //         });
  //       } else {
  //         try {
  //           cloudinary.uploader
  //             .upload(req.file.path, { folder: "BookLib-img" })
  //             .then(result => {
  //               const body = {
  //                 ...req.body,
  //                 created_at: date,
  //                 updated_at: date,
  //                 url_img: result.url
  //               };
  //               bookModel
  //                 .addBook(body)
  //                 .then(response => formRes.addBook1(res, response, 200))
  //                 .catch(err => console.log(err));
  //             });
  //         } catch (err) {
  //           res.json({
  //             err: "Cannot Upload File"
  //           });
  //         }
  //       }
  //     }
  //   });
  // },
  // WITHOUT IMAGE
  addBook: (req, res) => {
    //  const bodyReq = req.body;
    verifyAdmin(req, res);
    // } else {
    var date = new Date();
    const body = {
      ...req.body,
      created_at: date,
      updated_at: date
      // url_img: result.url
    };
    bookModel
      .addBook(body)
      .then(response => formRes.addBook1(res, response, 200))
      .catch(err => console.log(err));
    // }
  },
  updateBook: (req, res) => {
    verifyAdmin(req, res);
    var date = new Date();
    const id = req.query.id;
    // console.log('ini adalah id:',id)
    const body = {
      ...req.body,
      updated_at: date
    };
    // console.log(body)
    bookModel
      .updateBook(body, id)
      .then(response => formRes.updateBook1(res, response, 200))
      .catch(err => console.log(err));
  },
  borrowBook: (req, res) => {
    var date = new Date();
    const id = req.query.id;

    // console.log('ini adalah id:',id)
    const body = {
      ...req.body,
      updated_at: date
    };
    // console.log(body)
    bookModel
      .borrowBook(body, id)
      .then(response => formRes.updateBook1(res, response, 200))
      .catch(err => console.log(err));
  },
  returnBook: (req, res) => {
    var date = new Date();
    const id = req.query.id;

    // console.log('ini adalah id:',id)
    const body = {
      ...req.body,
      updated_at: date
    };
    // console.log(body)
    bookModel
      .returnBook(body, id)
      .then(response => formRes.updateBook1(res, response, 200))
      .catch(err => console.log(err));
  },
  deleteBook: (req, res) => {
    verifyAdmin(req, res);
    const id = req.query.id;
    // console.log('ini adalah id:',id)
    // const body = {
    //   ...req.body,
    //   updated_at: date
    // }
    // console.log(body)
    bookModel
      .deleteBook(id)
      .then(response => formRes.deleteBook1(res, response, 200))
      .catch(err => console.log(err));
  },
  wishlistUser: (req, res) => {
    const id_user = req.query.id;
    bookModel
      .wishlistUser(id_user)
      .then(response => formRes.searchBook1(res, response, 200))
      .catch(err => console.log(err));
  },

  addWishlist: (req, res) => {
    //  const bodyReq = req.body;
    const body = {
      ...req.body
    };
    var date = new Date();
    bookModel
      .addWishlist(body)
      .then(response => formRes.addBook1(res, response, 200))
      .catch(err => console.log(err));
  },
  addBorrow: (req, res) => {
    //  const bodyReq = req.body;
    var date = new Date();
    const body = {
      ...req.body,
      borrow_at: date
    };
    // console.log("isi body", body);
    bookModel
      .addBorrow(body)
      .then(response => formRes.addBook1(res, response, 200))
      .catch(err => console.log(err));
  },
  updateBorrow: (req, res) => {
    var date = new Date();
    const id = req.query.id;
    const body = {
      return_at: date
    };
    // console.log(body)
    bookModel
      .updateBorrow(body, id)
      .then(response => formRes.updateBook1(res, response, 200))
      .catch(err => console.log(err));
  },
  getBorrow: (req, res) => {
    const id_user = req.query.id_user;
    const id_book = req.query.id_book;
    bookModel
      .getBorrow(id_user, id_book)
      .then(response => formRes.filterStatus1(res, response, 200))
      .catch(err => console.log(err));
  },
  getdetailBorrow: (req, res) => {
    const id_user = req.query.id;
    bookModel
      .getdetailBorrow(id_user)
      .then(response => formRes.filterStatus1(res, response, 200))
      .catch(err => console.log(err));
  },
  removeWishlist: (req, res) => {
    const id = req.query.id;
    bookModel
      .removeWishlist(id)
      .then(response => formRes.deleteBook1(res, response, 200))
      .catch(err => console.log(err));
  }
  // }
  // }
  // }
  // });
  // },
};

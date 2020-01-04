const express = require("express");
const bookController = require("../Controllers/book");
const Router = express.Router();
// const verifyAdmin = require("../Configs/auth");

Router.get("/filterstatus", bookController.filterStatus);
Router.get("/filtergenre", bookController.filterGenre);
Router.get("/detail", bookController.detailBook);
Router.get("/searchbook", bookController.searchBook);
Router.get("/wishlist", bookController.wishlistUser);
Router.get("/borrow", bookController.getBorrow);
Router.get("/detailborrow", bookController.getdetailBorrow);
Router.post("/addwishlist", bookController.addWishlist);
Router.delete("/removewishlist", bookController.removeWishlist);
Router.get("/", bookController.showAllBook);

Router.get("/popular", bookController.popularBook);
Router.post("/addbook", bookController.addBook);
Router.put("/updatebook", bookController.updateBook);
Router.put("/borrow", bookController.borrowBook);
Router.post("/addborrow", bookController.addBorrow);
Router.put("/updateborrow", bookController.updateBorrow);
Router.put("/return", bookController.returnBook);
Router.delete("/deletebook", bookController.deleteBook);

module.exports = Router;

const db = require("../Configs/db");

module.exports = {
  showAllBook: () => {
    return new Promise((resolve, reject) => {
      db.query(
        `SELECT * FROM books_table ORDER BY id DESC`,
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },

  popularBook: () => {
    return new Promise((resolve, reject) => {
      db.query(
        `SELECT * FROM books_table ORDER BY id ASC LIMIT 5`,
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },
  detailBook: bookDetail => {
    return new Promise((resolve, reject) => {
      db.query(
        `SELECT * FROM books_table WHERE id=?`,
        [bookDetail],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },

  //  'SELECT * from cider.cid_contents where con_content like \'%'+ keyword +'%\' order by con_no desc;'

  searchBook: bookSearch => {
    return new Promise((resolve, reject) => {
      db.query(
        `SELECT * FROM books_table WHERE title LIKE CONCAT('%', ?,  '%') ORDER BY id DESC `,
        [bookSearch],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },

  filterGenre: bookGenre => {
    return new Promise((resolve, reject) => {
      db.query(
        `SELECT * FROM books_table WHERE genre=? ORDER BY id DESC`,
        [bookGenre],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },

  filterStatus: bookStatus => {
    return new Promise((resolve, reject) => {
      db.query(
        `SELECT * FROM books_table WHERE status=?`,
        [bookStatus],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },

  addBook: body => {
    return new Promise((resolve, reject) => {
      db.query("INSERT INTO books_table SET ?", [body], (err, response) => {
        if (!err) {
          resolve(response);
        } else {
          reject(err);
        }
      });
    });
  },

  updateBook: (body, id) => {
    return new Promise((resolve, reject) => {
      db.query(
        "UPDATE books_table SET ? WHERE id = ?",
        [body, id],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },
  borrowBook: (body, id) => {
    return new Promise((resolve, reject) => {
      db.query(
        "UPDATE books_table SET ? WHERE id = ?",
        [body, id],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },
  returnBook: (body, id) => {
    return new Promise((resolve, reject) => {
      db.query(
        "UPDATE books_table SET ? WHERE id = ?",
        [body, id],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },
  deleteBook: id => {
    return new Promise((resolve, reject) => {
      db.query(
        "DELETE FROM books_table WHERE id = ?",
        [id],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },

  wishlistUser: id_user => {
    return new Promise((resolve, reject) => {
      db.query(
        `SELECT wishlist.id, user.name,books_table.id AS id_book, books_table.title,books_table.author,books_table.url_img FROM wishlist JOIN user ON wishlist.id_user = user.id JOIN books_table ON wishlist.id_book = books_table.id WHERE wishlist.id_user = ? ORDER BY id DESC`,
        [id_user],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },
  addWishlist: body => {
    return new Promise((resolve, reject) => {
      db.query("INSERT INTO wishlist SET ?", [body], (err, response) => {
        if (!err) {
          resolve(response);
        } else {
          reject(err);
        }
      });
    });
  },
  addBorrow: body => {
    return new Promise((resolve, reject) => {
      db.query("INSERT INTO borrow SET ?", [body], (err, response) => {
        if (!err) {
          resolve(response);
        } else {
          reject(err);
        }
      });
    });
  },
  updateBorrow: (body, id) => {
    return new Promise((resolve, reject) => {
      db.query(
        "UPDATE borrow SET ? WHERE id = ?",
        [body, id],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },
  getBorrow: (id_user, id_book) => {
    return new Promise((resolve, reject) => {
      db.query(
        `SELECT * FROM borrow WHERE id_user=? && id_book=?`,
        [id_user, id_book],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },
  getdetailBorrow: id_user => {
    return new Promise((resolve, reject) => {
      db.query(
        `SELECT borrow.id, books_table.title,books_table.author, books_table.url_img, borrow.borrow_at,borrow.return_at FROM borrow JOIN books_table ON books_table.id = borrow.id_book WHERE borrow.id_user=? ORDER BY id DESC`,
        [id_user],
        (err, response) => {
          if (!err) {
            resolve(response);
          } else {
            reject(err);
          }
        }
      );
    });
  },
  removeWishlist: id => {
    return new Promise((resolve, reject) => {
      db.query("DELETE FROM wishlist WHERE id = ?", [id], (err, response) => {
        if (!err) {
          resolve(response);
        } else {
          reject(err);
        }
      });
    });
  }
  // SELECT wishlist.id, user.name, books_table.title FROM wishlist JOIN user ON wishlist.id_user = user.id JOIN books_table ON wishlist.id_book = books_table.id WHERE wishlist.id_user=5
  // SELECT borrow.id, books_table.title,books_table.author, books_table.url_img, borrow.borrow_at,borrow.return_at FROM borrow JOIN books_table ON books_table.id = borrow.id_book WHERE borrow.id_user=9
};

# Book-Library-Express-Api

Book Library API Nodejs Express

[Link Host](http://nameless-plateau-17084.herokuapp.com/book/)

<!-- Related project : [Hime Restaurant Point Of Sales Frontend](https://github.com/iyansr/hime-restaurant) -->

<div align='center'>
  <img src='https://raw.githubusercontent.com/arul29/Simple-REST-API-Node-Express-MySQL/master/img/ExpressMySQL.jpg' width='800'  />
</div>

---

## Table Of Contents

- [Table Of Content](#table-of-content)
- [Features](#features)
- [Build Setup](#build-setup)
- [Stacks](#stacks)
- [Dependencies](#dependencies)
- [Aplication Structure](#aplication-Structure)
- [API Docs](#api-docs)
  <!-- - [Novel](#novel)
  - [Genre](#genre) -->

## Features

- List Book
- CRUD Book
- Borrow/Return Book
- History Borrow
- Wishlist Book
- Login with JWT

## Build Setup

- Clone Repository
  `https://github.com/arul29/Book-Library-Express-Api.git`

- Make the `.env` file

  ```env
  DB_HOST =
  DB_USER =
  DB_PASSWORD =
  DB_DATABASE =

  CLOUDINARY_CLOUD_NAME =
  CLOUDINARY_API_KEY =
  CLOUDINARY_API_SECRET =

  SECRET_KEY =
  ```

* Install Dependencies

  ```bash
  # with yarn
  $ yarn install

  # or with npm
  $ npm install
  ```

* Run Server

  ```bash
  # with npm
  $ npm start
  ```

* Server will running on port `8000`

## Stacks

- Node JS
- Express
- MySQL

## Dependencies

- multer
- cloudinary
- jsonwebtoken
- cors
- nodemon
- dontenv
- bcryptjs

## Aplication Structure

- `app.js` - Entry point of our aplication
- `src/Config` - This folder contain configuration files of our app, such as mysql connection
- `src/Models` - This folder containt files that define query of MysQL
- `src/Routes` - Route of our app going here
- `src/Helpers` - This folder contain file that help you simplify your code such as define the error handling
- `src/Controllers` - This folder contain configuration files that links Models to Route

---

## API Docs

| Method | Endpoint           | Description            | Request Param | Request Body                                                                                                                                                  | Request Query              |
| ------ | ------------------ | ---------------------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- |
| GET    | /book              | Show All Book          | -             | -                                                                                                                                                             | -                          |
| GET    | /book/filterstatus | Show Book by Status    | -             | -                                                                                                                                                             | `status`:STRING (Required) |
| GET    | /book/filtergenre  | Show Book by Genre     | -             | -                                                                                                                                                             | `genre`:STRING (Required)  |
| POST   | /book/addbook      | Add New Book           | -             | `title`:STRING (Required) `author`:STRING (Required) `status`:STRING (Required) `genre`:STRING (Required) `url_img`:STRING (Required) `des`:STRING (Required) | -                          |
| PUT    | /book/updatebook   | Update Book by Id      | -             | `title`:STRING (Required) `author`:STRING (Required) `status`:STRING (Required) `genre`:STRING (Required)                                                     | `id`:NUMBER (Required)     |
| DELETE | /book/deletebook   | Delete Book by Id      | -             | -                                                                                                                                                             | `id`:NUMBER (Required)     |
| POST   | /user/register     | Register User          | -             | `email`:STRING (Required) `password`:STRING (Required) `name`:STRING (Required)                                                                               | -                          |
| POST   | /user/login        | Login User             | -             | `email`:STRING (Required) `password`:STRING (Required)                                                                                                        | -                          |
| POST   | /book/addwishlist  | Add Wishlist Book User | -             | `id_book`:NUMBER (Required) `id_user`:NUMBER (Required)                                                                                                       | -                          |
| POST   | /book/addborrow    | Add Borrow Book User   | -             | `id_book`:NUMBER (Required) `id_user`:NUMBER (Required)                                                                                                       | -                          |

---

Copyright © 2019 by Andi Mashdarul Khair

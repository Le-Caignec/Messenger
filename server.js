// -> See https://socket.io/get-started/chat#Broadcasting
//Express initializes app to be a function handler that you can supply to an
//HTTP server (see bellow) (line 4 and 5)
var require;
var req;
var express = require("express");
var on = require("process");
var app = express();
var http = require("http").createServer(app);
var swig = require("swig"); //template engine

app.set("view engine", "tpl");
app.use(express.static("public"));
app.use(express.static("node_modules/bootstrap/dist/css"));

// Step 1 : how it works to serve html page
app.get("/", (req, res) => {
  res.writeHead(200, { "Content-Type": "text/html" });
  res.write(swig.renderFile("index.tpl"));
  res.end();
});

// Step 2 : let us add the websocket part
// Initialize a new instance of socket.io by passing the http (the HTTP server) object.
var io = require("socket.io")(http);
//----------------------------------------------------------------------------------------

// creer une liste d'utilisatuer connecté
var users_list = [];

//----------------------------------------------------------------------------------------

// creer une liste salon composée de quatre sous listes: une pour contenir les trois derniers messages,
// une pour les utilisateurs qui ont rejoint le salon, une pour les 3 derniers users a avoir ecrit un message et un avec la date des 3 derniers messages.
var users1_histo1 = new Array(0, 0, 0);
var date1_histo1 = new Array(0, 0, 0);
var messages1_histo1 = new Array(0, 0, 0);
var salon1 = [messages1_histo1, users1_histo1, date1_histo1];

var users2_histo2 = new Array(0, 0, 0);
var date2_histo2 = new Array(0, 0, 0);
var messages2_histo2 = new Array(0, 0, 0);
var salon2 = [messages2_histo2, users2_histo2, date2_histo2];

var users3_histo3 = new Array(0, 0, 0);
var date3_histo3 = new Array(0, 0, 0);
var messages3_histo3 = new Array(0, 0, 0);
var salon3 = [messages3_histo3, users3_histo3, date3_histo3];

var users4_histo4 = new Array(0, 0, 0);
var date4_histo4 = new Array(0, 0, 0);
var messages4_histo4 = new Array(0, 0, 0);
var salon4 = [messages4_histo4, users4_histo4, date4_histo4];

//----------------------------------------------------------------------------------------

// Listen on the connection event for incoming sockets and log it to the console.
io.on("connection", (socket) => {
  socket.on("login", (user) => {
    console.log("user: " + user + " is connected");
    users_list.push(user); //Ajout du nom du nouvel utilisateur à la liste users_list lors de sa connexion
    var rang = users_list.length - 1; //On récupère son rang, il correspond à son indice de connexion, cela permet de créer un id unique par utilisateur utilisé dans le .tpl
    socket.emit("rang", rang);

    socket.on("deconnect", (rg) => {
      //A la deconnexion on recupere le rang de l'utilisateur qui se deconnecte et on le met a null dans liste pour ne plus l'afficher en tant que connecté chez les autres utilisateurs
      var rg_deco = users_list[rg];
      socket.emit("rg_deconnecté", { rang: rg, list: rg_deco });
      socket.broadcast.emit("rg_deconnecté2", { rang: rg, list: rg_deco });
      users_list[rg] = null;
    });

    //A chaque nouvelle connexion on rafraichit la liste des utilisateurs pour afficher le nouveau
    socket.broadcast.emit("userlist_refresh2", { rg: rang, list: users_list });
    socket.emit("userlist_refresh", { rg: rang, list: users_list });

    //----------------------------------------------------------------------------------------
    // Reaction à la demande de l'historique des messages par la page web
    //Lorsqu'on se connecte a un nouveau salon on demande au serveur de nous fournir l'historique des 3 derniers messages stocké dans salon1,salon2....
    socket.on("ask1", () => {
      socket.emit("message_histo1", salon1);
      console.log(salon1);
    });

    socket.on("ask2", () => {
      socket.emit("message_histo2", salon2);
    });

    socket.on("ask3", () => {
      socket.emit("message_histo3", salon3);
    });

    socket.on("ask4", () => {
      socket.emit("message_histo4", salon4);
    });

    //----------------------------------------------------------------------------------------
    // Action lors de l'appui du boutton send et que l'on est dans le salon 1
    // On regarde si le tableau d'historique est plein ou non. Si il est plein on translate la liste des messages afin d'ajouter le dernier message en dernière position
    //Si il n'est pas plein on ajoute le nouveau message a la première position vide de la liste
    socket.on("messageSent1", function (data) {
      var curentUser = data.datasuser;
      var msg = data.datasmsg;
      var current_salon = data.datasalon;
      var date = data.datasdate;
      var i = 0;
      while (messages1_histo1[i] !== 0 && i < 3) {
        i = i + 1;
      }
      if (i == 3) {
        messages1_histo1[0] = messages1_histo1[1];
        date1_histo1[0] = date1_histo1[1];
        users1_histo1[0] = users1_histo1[1];

        messages1_histo1[1] = messages1_histo1[2];
        date1_histo1[1] = date1_histo1[2];
        users1_histo1[1] = users1_histo1[2];

        messages1_histo1[2] = msg;
        date1_histo1[2] = date;
        users1_histo1[2] = curentUser;
      } else {
        messages1_histo1[i] = msg;
        date1_histo1[i] = date;
        users1_histo1[i] = curentUser;
      }
      socket.broadcast.emit("messageRecive1", {
        datarmsg: msg,
        dataruser: curentUser,
        datarsalon: current_salon,
        datardate: date,
      });
    });

    //----------------------------------------------------------------------------------------
    // Action lors de l'appui du boutton send et que l'on est dans le salon 2. Fonctionnement identique au salon1.

    socket.on("messageSent2", function (data) {
      var curentUser = data.datasuser;
      var msg = data.datasmsg;
      var current_salon = data.datasalon;
      var date = data.datasdate;
      var i = 0;
      while (messages2_histo2[i] !== 0 && i < 3) {
        i = i + 1;
      }
      if (i == 3) {
        messages2_histo2[0] = messages2_histo2[1];
        date2_histo2[0] = date2_histo2[1];
        users2_histo2[0] = users2_histo2[1];

        messages2_histo2[1] = messages2_histo2[2];
        date2_histo2[1] = date2_histo2[2];
        users2_histo2[1] = users2_histo2[2];

        messages2_histo2[2] = msg;
        date2_histo2[2] = date;
        users2_histo2[2] = curentUser;
      } else {
        messages2_histo2[i] = msg;
        date2_histo2[i] = date;
        users2_histo2[i] = curentUser;
      }
      socket.broadcast.emit("messageRecive2", {
        datarmsg: msg,
        dataruser: curentUser,
        datarsalon: current_salon,
        datardate: date,
      });
    });
    //----------------------------------------------------------------------------------------
    // Action lors de l'appui du boutton send et que l'on est dans le salon 3. Fonctionnement identique au salon1.

    socket.on("messageSent3", function (data) {
      var curentUser = data.datasuser;
      var msg = data.datasmsg;
      var current_salon = data.datasalon;
      var date = data.datasdate;
      var i = 0;
      while (messages3_histo3[i] !== 0 && i < 3) {
        i = i + 1;
      }
      if (i == 3) {
        messages3_histo3[0] = messages3_histo3[1];
        date3_histo3[0] = date3_histo3[1];
        users3_histo3[0] = users3_histo3[1];

        messages3_histo3[1] = messages3_histo3[2];
        date3_histo3[1] = date3_histo3[2];
        users3_histo3[1] = users3_histo3[2];

        messages3_histo3[2] = msg;
        date3_histo3[2] = date;
        users3_histo3[2] = curentUser;
      } else {
        messages3_histo3[i] = msg;
        date3_histo3[i] = date;
        users3_histo3[i] = curentUser;
      }
      socket.broadcast.emit("messageRecive3", {
        datarmsg: msg,
        dataruser: curentUser,
        datarsalon: current_salon,
        datardate: date,
      });
    });

    //----------------------------------------------------------------------------------------
    // Action lors de l'appui du boutton send et que l'on est dans le salon 4. Fonctionnement identique au salon1.

    socket.on("messageSent4", function (data) {
      var curentUser = data.datasuser;
      var msg = data.datasmsg;
      var current_salon = data.datasalon;
      var date = data.datasdate;
      var i = 0;
      while (messages4_histo4[i] !== 0 && i < 3) {
        i = i + 1;
      }
      if (i == 3) {
        messages4_histo4[0] = messages4_histo4[1];
        date4_histo4[0] = date4_histo4[1];
        users4_histo4[0] = users4_histo4[1];

        messages4_histo4[1] = messages4_histo4[2];
        date4_histo4[1] = date4_histo4[2];
        users4_histo4[1] = users4_histo4[2];

        messages4_histo4[2] = msg;
        date4_histo4[2] = date;
        users4_histo4[2] = curentUser;
      } else {
        messages4_histo4[i] = msg;
        date4_histo4[i] = date;
        users4_histo4[i] = curentUser;
      }
      socket.broadcast.emit("messageRecive4", {
        datarmsg: msg,
        dataruser: curentUser,
        datarsalon: current_salon,
        datardate: date,
      });
    });
  });
});

//We make the http server listen on port 3000.
http.listen(3000, () => {
  console.log("listening on port :3000");
});

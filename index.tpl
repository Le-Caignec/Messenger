<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>Chat App P&R</title>
        <link href="bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css" type="text/css" media="all" />
    </head>
    <body class="text-center">
        <div id="users">
        </div>

        <div id="chat_box">
            <div class="container p-0" >
                <svg width="6em" height="6em" viewBox="0 0 16 16" class="bi bi-chat-dots" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                    <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                </svg>
                <h1 class="h3 mb-3">Cha'TSE</h1>
                
                <!-- div pour bouton déconnecté -->
                    <form class="input-group" id="Déconnexion">
                        <button class="btn btn-danger " type="submit">Déconnexion</button>
                    </form>

                <!-- div pour bouton salon -->
                <div class="d-flex flex-row">
                    <form class="p-2" id="salon1">
                        <button  type="submit" class="btn btn-dark">Salon 1</button>
                    </form>
                    <form class="p-2" id="salon2">
                        <button type="submit" class="btn btn-dark">Salon 2</button>
                    </form>
                    <form class="p-2" id="salon3">
                        <button type="submit" class="btn btn-dark">Salon 3</button>
                    </form>
                    <form class="p-2" id="salon4">
                        <button type="submit" class="btn btn-dark">Salon 4</button>
                    </form>
                </div>

                <div class="card">
                    <div class="row g-0">
                        
                        <!-- div pour afficher la conlone à gauche du chat -->

                        <div id="person_co" class="col-12 col-lg-5 col-xl-3 border-right">

                            <!-- div pour chercher un personne connectée -->

                            <div class="px-4 d-none d-md-block">
                                <div class="d-flex align-items-center">
                                    <div class="d-flex flex-row">
                                        <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-person-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M8 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10zm4.854-7.85a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                                        </svg>
                                        <h5>Personnes connectées : </h5>
                                    </div>
                                </div>
                            </div>

                            <!-- div pour afficher des personnes connectées dans la colone sur le coté droit -->
                                 <!-- du code HTML est ajouté ici dés que quelqu'un ce connect -->

                            <hr class="d-block d-lg-none mt-1 mb-0">

                        </div>

                        <!-- div pour afficher au dessus de la chat la chat-box principale qui est le destinataire du message -->
                           
                        <div class="col-12 col-lg-7 col-xl-9">

                            <!-- div pour afficher les msgs dans la chatbox -->
                            <div class="position-relative" id="messagesContent">

                            </div>

                            <!-- div pour envoyer un message  -->

                            <div class="flex-grow-0 py-3 px-4 border-top">
                                <form class="input-group" id=sendForm>
                                    <input type="text" id="msgInput" class="form-control" placeholder="Entrez votre message">
                                    <button class="btn btn-primary" type="submit">Envoyer</button>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>

        <form class="loginform" id="loginform">
            <svg width="5em" height="5em" viewBox="0 0 16 16" class="bi bi-shield-lock" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M5.443 1.991a60.17 60.17 0 0 0-2.725.802.454.454 0 0 0-.315.366C1.87 7.056 3.1 9.9 4.567 11.773c.736.94 1.533 1.636 2.197 2.093.333.228.626.394.857.5.116.053.21.089.282.11A.73.73 0 0 0 8 14.5c.007-.001.038-.005.097-.023.072-.022.166-.058.282-.111.23-.106.525-.272.857-.5a10.197 10.197 0 0 0 2.197-2.093C12.9 9.9 14.13 7.056 13.597 3.159a.454.454 0 0 0-.315-.366c-.626-.2-1.682-.526-2.725-.802C9.491 1.71 8.51 1.5 8 1.5c-.51 0-1.49.21-2.557.491zm-.256-.966C6.23.749 7.337.5 8 .5c.662 0 1.77.249 2.813.525a61.09 61.09 0 0 1 2.772.815c.528.168.926.623 1.003 1.184.573 4.197-.756 7.307-2.367 9.365a11.191 11.191 0 0 1-2.418 2.3 6.942 6.942 0 0 1-1.007.586c-.27.124-.558.225-.796.225s-.526-.101-.796-.225a6.908 6.908 0 0 1-1.007-.586 11.192 11.192 0 0 1-2.417-2.3C2.167 10.331.839 7.221 1.412 3.024A1.454 1.454 0 0 1 2.415 1.84a61.11 61.11 0 0 1 2.772-.815z"/>
                <path d="M9.5 6.5a1.5 1.5 0 0 1-1 1.415l.385 1.99a.5.5 0 0 1-.491.595h-.788a.5.5 0 0 1-.49-.595l.384-1.99a1.5 1.5 0 1 1 2-1.415z"/>
            </svg>
            <h1 class="h3 mb-3 font-weight-normal">Veuillez vous identifier</h1>
            <label for="username" class="sr-only">Nom d'utilisateur</label>
            <input type="text" name="login" id="username" class="form-control" placeholder="Nom d'utilisateur" required autofocus>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Se Connecter</button>
            <p class="mt-5 mb-3 text-muted">&copy; developp by Paul & Robin</p>
        </form>

    
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="/socket.io/socket.io.js"></script>
        <script>
//----------------------------------------------------------------------------------------
// Permet d'afficher soit la chatbox soit l'écran de login en fonction de l'état de connexion de l'utilisateur
        document.getElementById("users").style.display = "none"; 
        document.getElementById("chat_box").style.display = "none"; 

        function login_to_chat(){
            document.getElementById("users").style.display = "block"; 
            document.getElementById("chat_box").style.display = "block"; 
            document.getElementById("loginform").style.display = "none"; 
        };
//----------------------------------------------------------------------------------------

        $(function() {
            var socket = io()
            var currentUser;
            var rg;
            var messages1_histo1;
            var users1_histo1;
            var date1_histo1;
            var messages2_histo2;
            var users2_histo2;
            var date2_histo2;
            var messages3_histo3;
            var users3_histo3;
            var date3_histo3;
            var messages4_histo4;
            var users4_histo4;
            var date4_histo4;
            var current_salon=0;
            // Step 2
            // I don't need to specify any URL when I call io(), since
            // it defaults to trying to connect to the host that serves the page.
            
            // Step 3 : send data / object
            // Retrieve data from the loggin form; the server gets is as a login events
            // -> and back to the server file to retrieve the info sent
            $('#loginform').submit(function(e) {
                e.preventDefault(); // prevents page reloading
                socket.emit('login', $('#username').val());
                me=$('#username').val();
                currentUser=me;
                alert(me+" vous etes bien connecté")
                login_to_chat();

                socket.on('rang', (rang)=> {
                    rg=rang;
                });
//----------------------------------------------------------------------------------------
// prtmrt de supprimer l'utilisateur qui s'est deconnecté
                socket.on("rg_deconnecté", function(aff){
                    var rg_deco = aff.rang;
                    var nom = aff.list;
                    alert("Vous vous êtes déconnecté")
                });

                socket.on("rg_deconnecté2", function(aff){
                    var rg_deco = aff.rang;
                    var nom = aff.list;
                    alert(nom+" s'est déconnecté");
                    $('#'+rg_deco).remove();
                });

//----------------------------------------------------------------------------------------
// Permet d'ajouter a la list d'untilisateur connecté un nouvelle utilisteur lorsque celui-ci se connect

                socket.on('userlist_refresh2', function(aff){
                var rg_co = aff.rg;
                var user_list = aff.list;
                alert(user_list[user_list.length-1]+' vient de se connecter');
                $('#person_co').append('<a id='+rg_co+' href="#" class="list-group-item list-group-item-action border-0"><div class="d-flex align-items-start"><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="'+user_list[user_list.length-1]+'" width="40" height="40"><div class="flex-grow-1 ml-3">'+user_list[user_list.length-1]+'<div class="small"><span class="fas fa-circle chat-online"></span> Online</div></div></div></a>')
                });

                socket.on('userlist_refresh', function(aff){
                    var rg_refr = aff.rg;
                    var user_list = aff.list;
                    for(var i in user_list){
                        if (user_list[i]!=null){
                            $('#person_co').append('<a id='+i+' href="#" class="list-group-item list-group-item-action border-0"><div class="d-flex align-items-start"><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="'+user_list[i]+'" width="40" height="40"><div class="flex-grow-1 ml-3">'+user_list[i]+'<div class="small"><span class="fas fa-circle chat-online"></span> Online</div></div></div></a>')
                        }
                    }
                });

//---------------------------------------------------------------------------------------- 
// Envoie le rg de l'utilisateur qui s'est deconnecté lorsque que celui-ci appuie sur le boutton deconnexion

                $('#Déconnexion').submit(function(e) {
                    socket.emit('deconnect', rg);
                });
//----------------------------------------------------------------------------------------
// Historisation des messages du salon 1 lorsque quelqu'un de nouveau se connect
// Réponse du ask1 par le serveur il nous envoie les infos d'historiques du salon et on les affiche
                socket.on("message_histo1",  (salon1)=> {
                    messages1_histo1=salon1[0];
                    users1_histo1=salon1[1];
                    date1_histo1=salon1[2];

                    for(var i in messages1_histo1){
                        if (messages1_histo1[i]!=0){
                                $("#messagesContent").append('<div class="chat-message-left pb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+date1_histo1[i]+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3"><div class="font-weight-bold mb-1">'+users1_histo1[i]+'</div>'+messages1_histo1[i]+'</div></div>')                            
                        }
                    }
                });
//----------------------------------------------------------------------------------------
// Historisation des messages du salon 2 lorsque quelqu'un de nouveau se connect

                socket.on("message_histo2",  (salon2)=> {
                    messages2_histo2=salon2[0];
                    users2_histo2=salon2[1];
                    date2_histo2=salon2[2];   
                    for(var i in messages2_histo2){
                        if (messages2_histo2[i]!=0){
                                $("#messagesContent").append('<div class="chat-message-left pb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+date2_histo2[i]+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3"><div class="font-weight-bold mb-1">'+users2_histo2[i]+'</div>'+messages2_histo2[i]+'</div></div>')                            
                        }
                    }
                });
//----------------------------------------------------------------------------------------
// Historisation des messages du salon 3 lorsque quelqu'un de nouveau se connect

                socket.on("message_histo3",  (salon3)=> {
                    messages3_histo3=salon3[0];
                    users3_histo3=salon3[1];
                    date3_histo3=salon3[2];  

                    for(var i in messages3_histo3){
                        if (messages3_histo3[i]!=0){
                                $("#messagesContent").append('<div class="chat-message-left pb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+date3_histo3[i]+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3"><div class="font-weight-bold mb-1">'+users3_histo3[i]+'</div>'+messages3_histo3[i]+'</div></div>')                            
                        }
                    }
                });
 //----------------------------------------------------------------------------------------
// Historisation des messages du salon 4 lorsque quelqu'un de nouveau se connect

                socket.on("message_histo4",  (salon4)=> {
                    messages4_histo4=salon4[0];
                    users4_histo4=salon4[1];
                    date4_histo4=salon4[2]; 

                    for(var i in messages4_histo4){
                        if (messages4_histo4[i]!=0){
                                $("#messagesContent").append('<div class="chat-message-left pb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+date4_histo4[i]+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3"><div class="font-weight-bold mb-1">'+users4_histo4[i]+'</div>'+messages4_histo4[i]+'</div></div>')                            
                        }
                    }
                });

//----------------------------------------------------------------------------------------
// Pour envoyer un message dans le bon salon de chat
//En fonction du salon choisit on affiche le message entré dans la chatbox et on l'envoie au serveur

                $('#sendForm').submit(function(e) {
                    var date = new Date();
                    var mois=date.getMonth()+1; // On ajoute 1 au mois pour l'affichage car janvier est le mois 0
                    var strDate = "Le "+date.getDate()+"/"+mois+" à "+date.getHours() + ":" + date.getMinutes();
                   
                    switch (current_salon){
                        case 1:
                            e.preventDefault();
                            msg=$('#msgInput').val();
                            $("#messagesContent").append('<div class="chat-message-right mb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+strDate+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3"><div class="font-weight-bold mb-1">Vous</div>'+msg+'</div></div>')        
                            socket.emit('messageSent1',{datasmsg : msg, datasuser : currentUser,datasalon:current_salon,datasdate:strDate});
                        break;

                        case 2:
                            e.preventDefault();
                            msg=$('#msgInput').val();
                            $("#messagesContent").append('<div class="chat-message-right mb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+strDate+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3"><div class="font-weight-bold mb-1">Vous</div>'+msg+'</div></div>')        
                            socket.emit('messageSent2',{datasmsg : msg, datasuser : currentUser,datasalon:current_salon,datasdate:strDate});
                        break;

                        case 3:
                            e.preventDefault();
                            msg=$('#msgInput').val();
                            $("#messagesContent").append('<div class="chat-message-right mb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+strDate+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3"><div class="font-weight-bold mb-1">Vous</div>'+msg+'</div></div>')        
                            socket.emit('messageSent3',{datasmsg : msg, datasuser : currentUser,datasalon:current_salon,datasdate:strDate});
                        break;

                        case 4:
                            e.preventDefault();
                            msg=$('#msgInput').val();
                            $("#messagesContent").append('<div class="chat-message-right mb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+strDate+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3"><div class="font-weight-bold mb-1">Vous</div>'+msg+'</div></div>')        
                            socket.emit('messageSent4',{datasmsg : msg, datasuser : currentUser,datasalon:current_salon,datasdate:strDate});
                        break;
                        default:
                            e.preventDefault();
                            alert("Vous n'avez pas selectionné de salon");
                    }
                });
              

//----------------------------------------------------------------------------------------
// Salon 1
//Lorsqu'on change de salon on clear la chatbox, on indique que le salon en cours est le 1, on demande l'historique des messages au serveur puis on l'affiche qaund il nous répond

                $('#salon1').submit(function(e) {
                    e.preventDefault();
                    var node = document.getElementById('messagesContent');
                    node.innerHTML = "";
                    current_salon=1;
                    socket.emit("ask1");
                });

                socket.on('messageRecive1',function (data)  {
                    var rUser = data.dataruser;
                    var rmsg = data.datarmsg;
                    var rsalon=data.datarsalon;
                    var rdate=data.datardate;
                    if (current_salon==rsalon){
                        $("#messagesContent").append('<div class="chat-message-left pb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+rdate+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3"><div class="font-weight-bold mb-1">'+rUser+'</div>'+rmsg+'</div></div>')
                    }
                });
//----------------------------------------------------------------------------------------
// Salon 2
                $('#salon2').submit(function(e) {
                    e.preventDefault();
                    var node = document.getElementById('messagesContent');
                    node.innerHTML = "";
                    current_salon=2;
                    socket.emit("ask2");
                });

                socket.on('messageRecive2',function (data)  {
                    var rUser = data.dataruser;
                    var rmsg = data.datarmsg;
                    var rsalon=data.datarsalon;
                    var rdate=data.datardate;
                    if (current_salon==rsalon){
                        $("#messagesContent").append('<div class="chat-message-left pb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+rdate+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3"><div class="font-weight-bold mb-1">'+rUser+'</div>'+rmsg+'</div></div>')
                    }
                });

//----------------------------------------------------------------------------------------
// Salon 3
                $('#salon3').submit(function(e) {
                    e.preventDefault();
                    var node = document.getElementById('messagesContent');
                    node.innerHTML = "";
                    current_salon=3;
                    socket.emit("ask3");
                });

                socket.on('messageRecive3',function (data)  {
                    var rUser = data.dataruser;
                    var rmsg = data.datarmsg;
                    var rsalon=data.datarsalon;
                    var rdate=data.datardate;
                    if (current_salon==rsalon){
                        $("#messagesContent").append('<div class="chat-message-left pb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+rdate+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3"><div class="font-weight-bold mb-1">'+rUser+'</div>'+rmsg+'</div></div>')
                    }
                });
//----------------------------------------------------------------------------------------
// Salon 4
                $('#salon4').submit(function(e) {
                    e.preventDefault();
                    var node = document.getElementById('messagesContent');
                    node.innerHTML = "";
                    current_salon=4;
                    socket.emit("ask4");
                });

                socket.on('messageRecive4',function (data)  {
                    var rUser = data.dataruser;
                    var rmsg = data.datarmsg;
                    var rsalon=data.datarsalon;
                    var rdate=data.datardate;
                    if (current_salon==rsalon){
                        $("#messagesContent").append('<div class="chat-message-left pb-4"><div><img src="https://www.icone-png.com/png/3/2625.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40"><div class="text-muted small text-nowrap mt-2">'+rdate+'</div></div><div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3"><div class="font-weight-bold mb-1">'+rUser+'</div>'+rmsg+'</div></div>')
                    }
                });

            });

        });
 
        </script>
    </body>
</html>

<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineStore._Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>PROJECT 1</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <% Response.WriteFile("./Scripts/ScriptsReferences"); %>
    <style>
        body {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            line-height: 1.8;
            background-color: black;
        }

        p {
            font-size: 16px;
        }

        .margin {
            margin-bottom: 45px;
        }

        .container-fluid {
            padding-top: 70px;
            padding-bottom: 70px;
        }

        .navbar {
            padding-top: 15px;
            padding-bottom: 15px;
            border: 0;
            border-radius: 0;
            margin-bottom: 0;
            font-size: 12px;
            letter-spacing: 5px;
            background-color: black;
        }

        .navbar-nav li a:hover {
            color: #1abc9c !important;
        }

        .carousel {
            height: 100%;
        }

        span {
            color: rgb(19, 78, 198);
            margin-top: 20px;
        }

        .carousel-item img {
            height: 40%;
            width: 40%;
        }


        .bg-1 {
            background-color: #474e5d;
            color: #ffffff;
            height: 55px;
        }



        footer {
            background-color: #2d2d30;
            color: #f5f5f5;
            padding: 32px;
            height: 55px;
        }
    </style>
</head>
<body>

    <!---------------------------------- Header   ------------------------------------>
    <div class="container">
        <nav class="row navbar navbar-expand-sm ">
            <ul class="navbar-nav col-10">
                <li class="nav-item active">
                    <a class="nav-link" href="#">
                        <h6>Home</h6>
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav navbar-right col-2">
                <li><a href="#"><i class="material-icons">shopping_cart</i></a></li>
            </ul>
        </nav>
    </div>
   

    <!---------------------------------------- Container 1 ------------------------------------------------>
    <div class="container">
        <div class="row">
            <div class="col-md-1">
            </div>
            <div class="col-md-10">
                <div id="demo" class="carousel slide container-fluid " data-ride="carousel" data-interval="2000">
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active text-center ">
                            <img src="https://webmppcapstone.blob.core.windows.net/breads-royaltyfree/cupcakes.png" class="center-block" alt="pie" width="600px" height="300px">
                            <div class="carousel-caption">
                                <span><b>Cupcake</b></span>
                            </div>
                        </div>
                        <div class="carousel-item text-center" role="listbox">
                            <img src="https://webmppcapstone.blob.core.windows.net/babycare-royaltyfree/babysuit.png" class="center-block" alt="bread" width="600px" height="300px">
                            <div class="carousel-caption">
                                <span><b>BabySuit</b></span>
                            </div>
                        </div>
                        <div class="carousel-item text-center" role="listbox">
                            <div>
                                <img src="https://webmppcapstone.blob.core.windows.net/babycare-royaltyfree/babyBottle.png" class="center-block" alt="baby bottle" width="600px" height="300px">
                            </div>
                            <div class="carousel-caption">
                                <span><b>BabyBottle</b></span>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>
            </div>
            <div class="col-md-1">
            </div>
        </div>
    </div>


    <!---------------------------------------- Container 2 ------------------------------------------------>
    <div class="container-fluid bg-1 text-center">
        <a href="./HomePage" class="btn btn-default btn-lg">
            <p class="glyphicon glyphicon-shopping-cart"><b>Go Shopping!</b></p>
        </a>
    </div>

    <!---------------------------------------- Footer ------------------------------------------------>
    <footer class="container-fluid text-center bg-2">
        <p>Made By <a href="#" data-toggle="tooltip" title="">Kirpal Singh</a></p>
    </footer>
</body>
</html>

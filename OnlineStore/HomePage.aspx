<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="OnlineStore.HomePage" %>

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
            color: rgb(245, 139, 0);
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


        .sidenav {
            color: lightblue;
        }

        .bg-1 {
            background-color: #474e5d;
            color: #ffffff;
        }



        footer {
            background-color: #2d2d30;
            color: #f5f5f5;
            padding: 32px;
            height: 55px;
        }

        .item-information {
            cursor: pointer;
            vertical-align: top;
            margin: 12px 10px 12px 10px;
            display: inline-block;
            height: 360px;
            width: 230px;
            background: white;
            position: relative;
            color: #5D5D5D;
            font-family: 'Segoe UI';
            box-shadow: 0px 0px 1px 2px #DEDEDE;
            border: 1px solid #9A9A9A;
            border-radius: 7px;
        }

        .item-information-price-overlay {
            display: block;
            position: absolute;
            right: 0px;
            top: 0px;
            margin: 2px 0px;
            background: white;
            border-radius: 7px;
            padding: 0px 6px;
            z-index: 1;
        }

        .item-information-imgcontainer {
            display: block;
            width: 226px;
            height: 226px;
            position: relative;
        }

        .item-information-image {
            display: block;
            margin: auto auto;
            width: auto;
            height: auto;
            border-radius: 7px;
            max-width: 226px;
            max-height: 226px;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
        }

        .item-information-data {
            padding: 4px;
        }

        .item-information-name {
            font-size: 18px;
            font-weight: 600;
            line-height: 1.25;
            display: block;
        }

        .item-information-desc {
            font-size: 14px;
            font-weight: 200;
            line-height: 1.5;
            display: block;
        }
    </style>

    <script>
        var globalJson;
        window.onload = function () {
            var ajax = new XMLHttpRequest();
            ajax.onreadystatechange = function () {
                if (ajax.status == 200 && ajax.readyState == 4) {
                    globalJson = JSON.parse(ajax.response);
                    createPage();
                }
                else if (ajax.readyState == 4) { alert("Could not find the file on the server."); }
            };
            ajax.open("GET", "StoreItems.json", true);

            ajax.onerror = function () { alert("Error sending request to the server."); }
            ajax.timeout = 2000;
            ajax.send();
        };




        //Defaults to using globalJson
        function createPage() {
            for (var i = 0; i < globalJson.length; ++i) {
                console.log(globalJson[i]);
                document.getElementById("to-put-content").appendChild(createNode(i, globalJson[i]));
            }
        }

        function createNode(index, node_source) {
            var tag = document.createElement("li");
            tag.className = "nav-item dropdown";
            var anchor = document.createElement("a");
            anchor.className = "nav-link dropdown-toggle";
            anchor.setAttribute("data-toggle", "dropdown");
            anchor.href = "#";
            anchor.innerHTML = node_source["category"];
            var dropdown = document.createElement("div");
            dropdown.className = "dropdown-menu";
            var anchorChilds = createAnchorChilds(index, node_source["subcategories"]);
            console.log(anchorChilds);
            for (var i = 0; i < anchorChilds.length; ++i) {
                dropdown.appendChild(anchorChilds[i]);
            }
            tag.appendChild(anchor);
            tag.appendChild(dropdown);
            return tag;
        }

        //<li class="nav-item dropdown">
        //    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Household and Beauty</a>
        //    <div class="dropdown-menu">
        //        <a class="dropdown-item" href="#">Baby Care</a>
        //        <a class="dropdown-item" href="#">Drug Store</a>
        //        <a class="dropdown-item" href="#">Household and Supply</a>
        //    </div>
        //</li>



        function createAnchorChilds(index, subcategories) {
            var childs = [];
            for (var i = 0; i < subcategories.length; ++i) {
                var anchor = document.createElement("a");
                anchor.className = "dropdown-item";
                anchor.href = "#";
                anchor.innerHTML = subcategories[i]["name"];
                anchor.setAttribute("onclick", "putContent(" + index + "," + i + ")");
                childs.push(anchor);
            }
            return childs;
        }

        function putContent(i, j) {
            document.getElementById("to-put-content2").innerHTML = "";
            var nodeData = globalJson[i]["subcategories"][j]["items"];
            for (var i = 0; i < nodeData.length; ++i) {
                document.getElementById("to-put-content2").appendChild(createDisplayNode(nodeData[i]));
            }
        }

        function shopping_cart(data) {
            console.log(data);
            if (data == true)
                alert("Item has been added to your cart");
            else alert("Item cannot be added to your cart");
        }
        function mouse_a1() {
            alert("mouse entered");
        }

        function mouse_a2() {
            alert("mouse out");
        }

        function additem(node) {
            var name = node.getElementsByClassName("item-information-name")[0].innerHTML;
            var price = node.getElementsByClassName("item-information-price-overlay")[0].innerHTML.split(" ")[1];

            $.ajax({
                type: "POST",
                url: "AddItem",
                dataType: "json",
                data: "ItemName=" + name + "&ItemPrice=" + price + "",
                success: shopping_cart
            })
        }

        function createDisplayNode(itemInformation) {
            var baseDiv = document.createElement("div");
            baseDiv.className = "item-information";
            baseDiv.setAttribute("onclick", "additem(this);");

            var secondLevelDiv = document.createElement("div");
            secondLevelDiv.className = "item-information-price-overlay";
            secondLevelDiv.innerHTML = "$ " + itemInformation["price"];

            var imageContainer = document.createElement("div");
            imageContainer.className = "item-information-imgcontainer";

            var image = document.createElement("img");
            image.src = itemInformation["imagelink"];
            image.className = "item-information-image";

            imageContainer.appendChild(image);

            var thirdLevelDiv = document.createElement("div");
            thirdLevelDiv.className = "item-information-data";

            var spanName = document.createElement("span");
            spanName.className = "item-information-name";
            spanName.innerHTML = itemInformation["name"];

            var spanDesc = document.createElement("span");
            spanDesc.className = "item-information-desc";
            spanDesc.innerHTML = itemInformation["description"];

            thirdLevelDiv.appendChild(spanName);
            thirdLevelDiv.appendChild(spanDesc);

            baseDiv.appendChild(secondLevelDiv);
            baseDiv.appendChild(imageContainer);
            baseDiv.appendChild(thirdLevelDiv);

            return baseDiv;
        }
        /*
        <div style="display: block; height: 280px; width: 230px; background: white; position: relative; color: #5D5D5D; font-family: 'Segoe UI';">
                    <div id="price-overlay" style="display: block; position: absolute; right: 0px; top: 0px; padding: 0px 4px; border: 1px solid #ABABAB; background: white;">$500.550</div>
                    <img src="hello.gif" style="display: block; margin: 2px; width: 226px; height: 226px;" />
                    <div style="padding:2px;">
                        <span id="name-overlay" style="font-size: 18px;font-weight: 600;line-height: 25%;display: block;position: relative;top: 8px;">Name</span>
                        <span id="desc-overlay" style="font-size: 14px; font-weight: 200;position: relative;top: 14px;">description</span>
                    </div>
                </div>
        */
    </script>
</head>

<body>

    <!---------------------------------- Header   ------------------------------------>
    <div class="container">
        <nav class="row navbar navbar-expand-sm ">
            <ul class="navbar-nav col-sm-9">
                <li class="nav-item active">
                    <a class="nav-link" href="/">
                        <h5>Home</h5>
                    </a>
                </li>

            </ul>


            <ul class="navbar-nav navbar-right col-sm-3">

                <li>
                    <a href="#">
                        <i class="material-icons" onmouseout="mouse_a1" onmouseenter="mouse_a2">shopping_cart</i>
                    </a>
                </li>
            </ul>
        </nav>
    </div>



    <div class="container">

        <div class="row">
            <!---------------------------------- Side Navigation   ------------------------------------>
            <div class="col-3 sidenav hidden-xs">
                <h4>Categories</h4>
                <ul class="navbar-nav nav-pills nav-stacked" id="to-put-content">
                </ul>
                <br>
            </div>
            <br>

            <!---------------------------------- Display Area   ------------------------------------>
            <div id="to-put-content2" class="col-9">
            </div>
        </div>
    </div>





    <!---------------------------------------- Footer ------------------------------------------------>
    <footer class="container-fluid text-center bg-2">
        <p>
            Made By
            <a href="#" data-toggle="tooltip" title="">Kirpal Singh</a>
        </p>
    </footer>


</body>

</html>

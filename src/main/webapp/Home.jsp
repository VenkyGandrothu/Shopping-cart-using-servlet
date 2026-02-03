<%@ page import="java.util.List" %>
<%@ page import="shoppingApp.Product" %>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home | Shopping Cart</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        body {
            background: #f5f6fa;
        }

        /* Navbar */
        .navbar {
            background: linear-gradient(90deg, #4facfe, #00f2fe);
            color: white;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .navbar h2 {
            font-size: 24px;
            font-weight: 700;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: 600;
            transition: 0.3s;
        }

        .navbar a:hover {
            color: #ffe600;
        }

        /* Welcome section */
        .welcome {
            text-align: center;
            padding: 50px 20px;
            background: #e3f2fd;
            color: #333;
        }

        .welcome h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }

        .welcome p {
            font-size: 18px;
            color: #555;
        }

        /* Products grid */
        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            padding: 40px;
            max-width: 1200px;
            margin: auto;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .card h3 {
            margin: 15px 0 10px;
            font-size: 20px;
            color: #333;
        }

        .card p {
            font-size: 18px;
            color: #4caf50;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .card button {
            background: linear-gradient(90deg, #4facfe, #00f2fe);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        .card button:hover {
            background: linear-gradient(90deg, #00f2fe, #4facfe);
        }

        @media (max-width: 600px) {
            .navbar h2 { font-size: 20px; }
            .welcome h1 { font-size: 28px; }
            .products { padding: 20px; gap: 20px; }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <h2>🛒 Shopping Cart</h2>
    <div>
        Welcome, <b><%= session.getAttribute("userEmail") %></b>
        <a href="cart.jsp">Cart</a>
        <a href="logout">Logout</a>
    </div>
</div>

<!-- Welcome -->
<div class="welcome">
    <h1>Welcome to Our Store</h1>
    <p>Browse and add products to your cart</p>
</div>

<!-- Products -->
<div class="products">
<%
    if(products != null) {
        for(Product p : products) {
%>
    <div class="card">
        <h3><%= p.getName() %></h3>
        <p>₹<%= p.getPrice() %></p>
        <form action="addToCart" method="post">
            <input type="hidden" name="pid" value="<%= p.getId() %>">
            <button type="submit">Add to Cart</button>
        </form>
    </div>
<%
        }
    }
%>
</div>

</body>
</html>

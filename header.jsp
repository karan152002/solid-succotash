
<header class="header">
    <div class="container-fluid con p-0">
        <div class="rows">
              <div class="navbar-logo">
                <img src="./assets/image/logo.png" alt="logo">
               </div>
            <input type="checkbox" id="nav-check">
            <label for="nav-check" class="nav-toggler"><i class="fas fa-bars"></i></label>
            <nav class="nav">
                 <ul>
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="products.jsp">Products</a></li>
                <li><a href="store.jsp">Store Locator</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
            </ul>
            </nav>
        </div>
    </div>
</header>
<script>
    // Get the current URL
    var currentUrl = window.location.href;

    // Get all the link elements inside the navigation
    var links = document.querySelectorAll('.nav a');

    // Iterate through each link and check if its href matches the current URL
    for (var i = 0; i < links.length; i++) {
        var link = links[i];

        if (link.href === currentUrl) {
            // Add the "active" class to the link if it matches the current URL
            link.classList.add('active');
        }
        else
        {
             link.classList.remove('active');
        }
        
    }
       var homeLink = document.querySelector('.nav a[href="index.jsp"]');
    if (!document.querySelector('.nav a.active') && homeLink) {
        homeLink.classList.add('active');
    }
</script>

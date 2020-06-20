<?PHP
/*
session_start();

include "Database.php";

if(!$_COOKIE['user_id']){
	header('Location: index.html');
}

$db = new Database();

$sql="SELECT * from user where user_id = '$_COOKIE[user_id]'";
$db->query($sql);
$user = $db->single();

*/
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New User</title>
    <link rel="stylesheet" href="style.css"> <!-- it is fixed to style.css -->
    <link rel="stylesheet" href="sidebar.css"> <!-- gonna stay the same file, just have to fix this to enable correct style -->
</head>

<body>

    <div id="sidebar">
        <div class="toggle-btn" onclick="toggleSidebar()">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <ul class="side-ul">
            <li class="side-li"><a class="side" href="index.html">Home Page</a></li> <!-- -->
        </ul>
    </div>

   <!--- <header id="imgcontainer"></header> -->
    <div id="container" style='margin-bottom:6em;text-align:center;'>
        <h1>New User</h1>

        <form  id="submit" action="addAnimalScript.php" method="POST">

            <label for="user_name">userName:</label><br>
            <input type="text"  name = "user_name" required><br>

            <label for="password">Password:</label><br>
            <input type="password" id = "password" name = "password" onkeyup = "password_check()" required><br>
		   
		    <label for="confirm_password">Confirm Password: </label><br>
            <input type="password" id = "confirm_password" name = "confirm_password" onkeyup = "password_check()"required><br>
			
            <button class="cancel" type="button" onclick="location.href='index.html'">Cancel</button>
            <button class="button" type="submit">Submit</button>
        </form>
    </div>
	<script> 
	function password_check() 
	{
		if (document.getElementById('password').value != document.getElementById('confirm_password').value) 
		{
			
			document.getElementById('confirm_password').setCustomValidity('Password Must be Matching.');
		}
		else 
		{
			document.getElementById('confirm_password').setCustomValidity(''); 
		}
	}
</script>
    <script src="sidebar.js"></script>
</body>

</html>

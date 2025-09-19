<?php
// Start the session
session_start();

// Include the database configuration file
require_once "db_config.php";

// Initialize variables
$email = $password = "";
$email_err = $password_err = $login_err = "";

// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Validate email
    if (empty(trim($_POST["email"]))) {
        $email_err = "Please enter email.";
    } else {
        $email = trim($_POST["email"]);
    }

    // Validate password
    if (empty(trim($_POST["password"]))) {
        $password_err = "Please enter your password.";
    } else {
        $password = trim($_POST["password"]);
    }

    // Validate credentials
    if (empty($email_err) && empty($password_err)) {
        // Prepare a select statement
        $sql = "SELECT id, fullname, email, password FROM users WHERE email = :email";

        if ($stmt = $pdo->prepare($sql)) {
            $stmt->bindParam(":email", $param_email, PDO::PARAM_STR);
            $param_email = $email;

            if ($stmt->execute()) {
                // Check if email exists, if yes then verify password
                if ($stmt->rowCount() == 1) {
                    if ($row = $stmt->fetch()) {
                        $id = $row["id"];
                        $fullname = $row["fullname"];
                        $hashed_password = $row["password"];
                        if (password_verify($password, $hashed_password)) {
                            // Password is correct, so start a new session
                            session_start();

                            // Store data in session variables
                            $_SESSION["loggedin"] = true;
                            $_SESSION["id"] = $id;
                            $_SESSION["fullname"] = $fullname;
                            $_SESSION["email"] = $email;

                            // Respond with success
                            echo json_encode(["success" => true, "message" => "Login successful.", "user" => ["id" => $id, "fullname" => $fullname, "email" => $email]]);

                        } else {
                            // Password is not valid
                           echo json_encode(["success" => false, "message" => "Invalid email or password."]);
                        }
                    }
                } else {
                    // Email doesn't exist
                    echo json_encode(["success" => false, "message" => "Invalid email or password."]);
                }
            } else {
                echo json_encode(["success" => false, "message" => "Oops! Something went wrong. Please try again later."]);
            }
            unset($stmt);
        }
    }
     // Close connection
    unset($pdo);
}
?>

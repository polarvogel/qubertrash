<html>
<body>

        <?php
                $uberspaceuser="--->> ANPASSEN <<---";

                if (isset($_POST["REDIRECT"]) && isset($_POST["DURATION"])) {
                        if (filter_var($_POST["REDIRECT"], FILTER_VALIDATE_EMAIL) && filter_var($_POST["DURATION"], FILTER_VALIDATE_INT)) {
                                exec("/home/".$uberspaceuser."/bin/qdated/generate_trash_mail.sh ".$_POST["REDIRECT"]." ".$_POST["DURATION"], $newtrashmail);
                                echo "<h2>Neue Adresse angelegt:</h2>";
                                echo "Adresse angelegt, sie lautet: ".$newtrashmail[0];

                        } else {
                                echo "<h2>Achtung!</h2>";
                                echo "Keine Trashmail angelegt: Ungueltige Eingaben! Versuche es erneut!";
                        }
                }

                echo "<h2>Aktuell angelegte Trashmails:</h2>";

                exec("/home/".$uberspaceuser."/bin/qdated/show_active_trashmails.sh",$output);
                foreach($output AS $line) {
                        echo $line."<br>";
                }

        ?>

        <h2>Neue Trashmail anlegen: </h2>
        <form method="post" action="index.php">
                Zieladresse: <input type="text" name="REDIRECT"> Gueltigkeit in Stunden: <input type="text" name="DURATION"> <input type="submit" name="generate" value="Anlegen">
        </form>

</body>
</html>

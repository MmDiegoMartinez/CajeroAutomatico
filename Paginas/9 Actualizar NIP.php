<?php
    session_start();
    if(!isset($_SESSION['usuario'])){
        header("Location: http://localhost/Cajero/Paginas/1%20Credenciales.php");

    }
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' type='text/css' href='../css.css'>
    <title>welcome</title>
</head>
<body>

    <nav>

    <h1><img src="..//img/BBVA2.png" width="60"> Bancomer</h1>
    <ul>
            <li><a href="2 Menu Principal.php"><img src="..//img/back.png" width="30">ㅤ</a></li>
        </ul>

    </nav>

    <?php

include_once("conexion.php");
require("conexion.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Este bloque se ejecuta solo si el formulario ha sido enviado

    if (isset($_POST['NIP']) && isset($_POST['cuenta'])) {
        $cuenta = $_POST['cuenta'];
        $NIP = $_POST['NIP'];

        // Verificar la longitud del NIP
        if (strlen($NIP) === 4) {
            $sql = "UPDATE cuentas SET NIP = :paramNIP WHERE Id_Cuenta = :paramID";
            $stmt = $conexion->prepare($sql);
            $stmt->bindParam(':paramNIP', $NIP, PDO::PARAM_STR);
            $stmt->bindParam(':paramID', $cuenta, PDO::PARAM_STR);

            if ($stmt->execute()) {
                echo "NIP ACTUALIZADO";
                header("Location: http://192.168.43.16//Cajero/Paginas/cerrarSesion.php");
                exit(); // Asegúrate de terminar la ejecución después de redirigir
            } else {
                echo "FAIL....";
            }
        } else {
            echo "La longitud del NIP no es válida. Debe tener exactamente 4 caracteres.";
        }
    }
}
?>

<div class="contenedor2">
    <form method="post" action="">
        <center>
        <?php
            echo "<font color='black' face='Courier New' size=3>";
            echo "Cambio de NIP, para  $_SESSION[nombre]  $_SESSION[apellido]\n";
            echo "</font>";
            ?>
            <input class="controls" type="number" id="NIP" name="NIP" value="<?php echo $_SESSION['nip']; ?>" placeholder="Nuevo NIP" required>
            <input type="hidden" name="cuenta" value="<?php echo $_SESSION['numcuenta']; ?>">
            <input class="bontons" type="submit" value="Cambiar NIP">
        </center>
    </form>
</div>
<footer>
        <p><br><br><br><br>© 2023 BBVA México, S.A., Institución de Banca Múltiple, Grupo Financiero BBVA México. Avenida Paseo de la Reforma 510, colonia Juárez, código postal 06600, alcaldía Cuauhtémoc, Ciudad de México.</p>
        <a href="#"><img src="..//img/BBVA2.png" width="160" height="56" ></a>
    </footer>



</body>

</html>
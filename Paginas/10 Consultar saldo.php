<?php
session_start();

if (!isset($_SESSION['usuario'])) {
    header("Location: http://localhost/Cajero/Paginas/1%20Credenciales.php");
    exit();
}

include_once("conexion.php"); 

$consulta = "SELECT Saldo FROM cuentas WHERE Id_Cuenta = :numcuenta";
$stmt = $conexion->prepare($consulta);
$stmt->bindParam(':numcuenta', $_SESSION['numcuenta']);
$stmt->execute();

if ($stmt) {
    $fila = $stmt->fetch(PDO::FETCH_ASSOC);
    $_SESSION['saldo'] = $fila['Saldo'];
} else {
    echo "Error en la consulta: " . $conexion->errorInfo()[2];
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' type='text/css' href='../css.css'>
    <title>sesion admin</title>
</head>

<body>

    <nav>

        <h1><img src="..//img/BBVA2.png" width="60"> Bancomer</h1>
        <ul>
            <li><a href="2 Menu Principal.php"><img src="..//img/back.png" width="30">ㅤ</a></li>
        </ul>

    </nav>

    <div class="contenedor2">
        <center>
            <h3>Saldo de tu tarjeta:</h3>
            <img src="..//img/BBVA2.png" width="60">
            <br>
            <div class="tarjeta">
                <div class="logo"></div>
                <div class="chip"></div>
                <div class="numero-tarjeta">
                    <span style="color: white;"><?php echo " $_SESSION[numcuenta] <br>";?></span>
                </div>
                <div class="nombre-titular"> <span style="color: white;"><?php echo "$_SESSION[nombre] $_SESSION[apellido] <br>";?></span></div>
                <div class="visa"></div>
            </div>
            <br>
            <?php
            echo "<font color='black' face='Courier New' size=3>";
            echo "Saldo Actual: $ $_SESSION[saldo]";
            echo "</font>";
            ?><br><br>
            <a href="2 Menu Principal.php"><input class="bontons" type="button" value="Menu"> </input></a><br>
        </center>

    </div>
    <br><br><br>

    <footer>
        <p><br><br><br><br>© 2023 BBVA México, S.A., Institución de Banca Múltiple, Grupo Financiero BBVA México. Avenida Paseo de la Reforma 510, colonia Juárez, código postal 06600, alcaldía Cuauhtémoc, Ciudad de México.</p>
        <a href="#"><img src="..//img/BBVA2.png" width="160" height="56"></a>
    </footer>

</body>

</html>

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
        <form method="POST" action="" name="">
            <center>
                <h3>informacion de la tarjeta:</h3>
                <br>
                <?php
                    echo "<font color='black' face='Courier New' size=3>";
                    echo "Titular: $_SESSION[nombre]  $_SESSION[apellido] <br>";
                    echo "Número de cuenta: $_SESSION[numcuenta] <br>";
                    echo "</font>";
                ?><br><br>
                <label>Ingrese el monto a depositar: $</label>
                <input class="controls" type="number" id="monto" name="monto" step="0.50" min="20" placeholder="0.00" required>
                <br> 
                <label>Mínimo a depositar: $20 pesos</label>
                <input class="bontons" type="submit" value="Depositar">
            </center>
        </form>

        <?php
            include_once("conexion.php");
            require("conexion.php");
            $numcuente = $_SESSION['numcuenta'];
            $dinero = isset($_POST["monto"]) ? $_POST["monto"] : 0;
            $tipoMovimiento = 'Depósito';

            try {
                $conexion->beginTransaction();
            
                $sql = "UPDATE Cuentas SET Saldo = Saldo + :monto WHERE Id_Cuenta = :cuenta";
                $stmt = $conexion->prepare($sql);
                $stmt->bindParam(':monto', $dinero, PDO::PARAM_STR);
                $stmt->bindParam(':cuenta', $numcuente, PDO::PARAM_STR);
                $stmt->execute();
            
                $_SESSION['saldo'] = $_SESSION['saldo'] + $dinero;
            
                $sqlInsertTransaccion = "INSERT INTO Transacciones (Id_Cuenta, Tipo_Movimiento, Monto) VALUES (:idCuenta, :tipoMovimiento, :monto)";
                $stmtInsertTransaccion = $conexion->prepare($sqlInsertTransaccion);
                $stmtInsertTransaccion->bindParam(':idCuenta', $numcuente, PDO::PARAM_STR);
                $stmtInsertTransaccion->bindParam(':tipoMovimiento', $tipoMovimiento, PDO::PARAM_STR);
                $stmtInsertTransaccion->bindParam(':monto', $dinero, PDO::PARAM_STR);
                $stmtInsertTransaccion->execute();
            
                $conexion->commit();
                echo "Saldo Actual: $ " . number_format($_SESSION['saldo'], 2);
            } catch (PDOException $e) {
                $conexion->rollBack();
                echo "Error en la transacción: " . $e->getMessage();
            }
        ?>
    </div>
    <br><br><br>

    <footer>
        <p><br><br><br><br>© 2023 BBVA México, S.A., Institución de Banca Múltiple, Grupo Financiero BBVA México. Avenida Paseo de la Reforma 510, colonia Juárez, código postal 06600, alcaldía Cuauhtémoc, Ciudad de México.</p>
        
        <a href="#"><img src="..//img/BBVA2.png" width="160" height="56" ></a>
    </footer>

</body>

</html>

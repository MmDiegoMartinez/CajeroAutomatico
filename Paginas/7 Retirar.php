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
        <form method="POST" action="8 Actualizar Saldo Reti.php" name="">
            <center>
                <h3>informacion de la tarjeta:</h3>
                <br>
                <?php
                echo "<font color='black' face='Courier New' size=3>";
                echo "Titular: $_SESSION[nombre]  $_SESSION[apellido] <br>";
                echo "Número de cuenta: $_SESSION[numcuenta] <br>";
                echo "Saldo Actual: $ $_SESSION[saldo]";
                
                echo "</font>";
                ?><br><br>
                <label>Ingrese el monto a retirar: $</label>
                
                <input class="controls" type="number" id="monto" name="monto" step="0.50" min="50" placeholder="0.00" required>
              <br> 
                <label>Mínimo a retirar: $50 pesos</label>
                <input class="bontons" type="submit" value="Retirar">
            </center>
        </form>



    </div>
    <br><br><br>

    <footer>
        
  
        <p><br><br><br><br>© 2023 BBVA México, S.A., Institución de Banca Múltiple, Grupo Financiero BBVA México. Avenida Paseo de la Reforma 510, colonia Juárez, código postal 06600, alcaldía Cuauhtémoc, Ciudad de México.</p>
        
        <a href="#"><img src="..//img/BBVA2.png" width="160" height="56" ></a>
    </footer>


</body>

</html>
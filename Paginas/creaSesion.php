<?php
    session_start();
    if($_POST){
        //$usuario=$_POST["usuario"];
        //$pass=$_POST["contra"];
        $tarjeta = $_POST["tarjeta"];
        $nip = $_POST["nip"];
        try {
            //code...
            include_once("conexion.php");
            require("conexion.php");
            $statement = $conexion->prepare("SELECT * FROM usuarios U JOIN cuentas C ON U.Num_Usu = C.Num_Usu WHERE C.Id_Cuenta = :tarjeta AND C.NIP = :nip;");              
            $statement->execute(['tarjeta' => $tarjeta ,'nip' =>  $nip]);
            $users=$statement->fetch(); 
            if(!$users){
                header("Location: http://192.168.43.16/Cajero/Paginas/1%20Credenciales.php");
                exit(); // Asegúrate de terminar la ejecución después de redirigir
                echo "Loggin Invalido";
            
            }else{
                $_SESSION['usuario'] = $users["Num_Usu"];
                $_SESSION['nombre'] = $users["Nombre"];
                $_SESSION['apellido'] = $users["Apellidos"];
                $_SESSION['numcuenta'] = $users["Id_Cuenta"];
                $_SESSION['saldo'] = $users["Saldo"];
                $_SESSION['nip'] = $users["NIP"];
                header("Location: http://192.168.43.16/Cajero/Paginas/2%20Menu%20Principal.php");
                exit(); // Asegúrate de terminar la ejecución después de redirigir
            }
     
        } catch (PDOException $e) {          
            echo "Error ..".$e->getMessage();
            die();
        }
    }else{ // cuando no hay post
        header("Location: http://192.168.43.16/Cajero/Paginas/1%20Credenciales.php");
        exit(); // Asegúrate de terminar la ejecución después de redirigir
    }

?>
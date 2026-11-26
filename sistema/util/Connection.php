<?php
require_once(__DIR__ . "/Config.php");

class Connection
{
    private static ?PDO $conn = null;

    public static function getConnection() 
    {
        if (self::$conn == null) {
            try {
                $opcoes = [
                    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
                    //Definindo erro como exception
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    //Retorno padrão de consultas fetch
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
                ];

                $strConn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME;
                self::$conn = new PDO($strConn, DB_USER , DB_PASSWORD , $opcoes);
            } catch (PDOException $e) {
                echo "Erro ao conectar-se na base de dados!!!";

                if(AMB_DEV)
                    print_r($e);
            }
        }
        
    }
}
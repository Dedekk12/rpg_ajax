<?php
require_once(__DIR__ . "/../data/PersonagemDao.php");

class PersonagemControll 
{
 
    private  PersonagemDao $persoDao;

    public function __construct()
    {
       $this->persoDao = new PersonagemDao();
        
    }
    
    public function listar(){
        $dados = $this->persoDao->list();
        return $dados;
    }
}
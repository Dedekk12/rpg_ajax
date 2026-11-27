<?php
require_once(__DIR__ . "/../util/Connection.php");
require_once(__DIR__ . "/../model/Personagem.php");

class PersonagemDao
{
    public function list()
    {
        try {
            $sql = "SELECT p.*, 
                    r.nome as nome_raca,
                    r.carater,
                    r.bonus as bonus_raca
                FROM `Personagem` as p
                JOIN `Raca`  r ON (r.id = p.id_raca)
                ORDER BY  p.nome, nome_raca";

            $conn = Connection::getConnection();
            $stm = $conn->prepare($sql);
            $stm->execute();
            $dados = $stm->fetchAll();
            return $this->map($dados);
        } catch (PDOException $e) {
            $erro = "Erro ao listar dados de personagem!";
            if (AMB_DEV)
                $erro .= "<br>" . $e->getMessage();

            return $erro;
        }
    }


    public function insert(Personagem $perso)
    {
        try {
            $sql = "INSERT INTO `Personagem`(nome,forca,agilidade,mental,genero,id_raca)
                    VALUES(:nome, :forca, :agilidade, :mental, :id_raca)";

            $conn = Connection::getConnection();
            $stm = $conn->prepare($sql);
            $stm->bindValue(":nome", $perso->getNome());
            $stm->bindValue(":forca", $perso->getForca());
            $stm->bindValue(":agilidade", $perso->getAgilidade());
            $stm->bindValue(":mental", $perso->getMental());
            $stm->bindValue(":id_raca", $perso->getRaca()->getId());
            $stm->execute();
            return "";
        } catch (PDOException $e) {
            $erro = "Erro ao inserir dados de personagem!";
            if (AMB_DEV)
                $erro .= "<br>" . $e->getMessage();

            return $erro;
        }
    }


    private function map(array $dados)
    {
        $objetos = [];

        foreach ($dados as $d) {
            $perso = new Personagem();

            $perso->setId($d["id"])
                ->setNome($d["nome"])
                ->setForca($d["forca"])
                ->setAgilidade($d["agilidade"])
                ->setMental($d["mental"])
                ->setGenero($d["genero"]);

            $raca = new Raca();

            $raca->setNome($d["nome_raca"])
                ->setBonus($d["bonus_raca"])
                ->setCarater($d["carater"]);

            $perso->setRaca($raca);

            array_push($objetos, $perso);
        }

        return $objetos;
    }
}

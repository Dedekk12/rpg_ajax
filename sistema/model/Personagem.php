<?php
require_once(__DIR__ . "/Inventario.php");
require_once(__DIR__ . "/Raca.php");

class Personagem {
    private ?int $id;
    private ?string $nome;
    private ?int $forca;
    private ?int $agilidade;
    private ?int $mental;
    private ?string $genero;
    private Raca $raca;
    private Inventario $inventario;

    public function calcVigor(int $bonusPocao = 0){
        return ($this->forca * $this->calcBonus()[0]) + (1  * $bonusPocao);
    }

    public function calcMana(int $bonusPocao = 0){
        return ($this->mental * $this->calcBonus()[1]) + (1  * $bonusPocao);
    }

    public function calcDefesa(int $bonusArmadura = 0){
        return ($this->agilidade * $this->calcBonus()[2])  + (1  * $bonusArmadura);
    }

    

    private function calcBonus()
    {
        switch ($this->raca->getCarater()) {
            case 'F':
                return [$this->raca->calcBonusF(), ($this->raca->calcBonusM()/5) , ($this->raca->calcBonusA()*(-1))];
                break;

            case 'M':
                return [($this->raca->calcBonusF()*(-1)), $this->raca->calcBonusM() , ($this->raca->calcBonusA()/5)];
                break;

            case 'A':
                return [($this->raca->calcBonusF()/5), ($this->raca->calcBonusM()*(-1)) , $this->raca->calcBonusA()];
                break;
        }
    }



    /**
     * Get the value of id
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * Set the value of id
     */
    public function setId(?int $id): self
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of nome
     */
    public function getNome(): ?string
    {
        return $this->nome;
    }

    /**
     * Set the value of nome
     */
    public function setNome(?string $nome): self
    {
        $this->nome = $nome;

        return $this;
    }

    /**
     * Get the value of forca
     */
    public function getForca(): ?int
    {
        return $this->forca;
    }

    /**
     * Set the value of forca
     */
    public function setForca(?int $forca): self
    {
        $this->forca = $forca;

        return $this;
    }

    /**
     * Get the value of agilidade
     */
    public function getAgilidade(): ?int
    {
        return $this->agilidade;
    }

    /**
     * Set the value of agilidade
     */
    public function setAgilidade(?int $agilidade): self
    {
        $this->agilidade = $agilidade;

        return $this;
    }

    /**
     * Get the value of mental
     */
    public function getMental(): ?int
    {
        return $this->mental;
    }

    /**
     * Set the value of mental
     */
    public function setMental(?int $mental): self
    {
        $this->mental = $mental;

        return $this;
    }

    /**
     * Get the value of genero
     */
    public function getGenero(): ?string
    {
        return $this->genero;
    }

    /**
     * Set the value of genero
     */
    public function setGenero(?string $genero): self
    {
        $this->genero = $genero;

        return $this;
    }

    /**
     * Get the value of raca
     */
    public function getRaca(): Raca
    {
        return $this->raca;
    }

    /**
     * Set the value of raca
     */
    public function setRaca(Raca $raca): self
    {
        $this->raca = $raca;

        return $this;
    }

    /**
     * Get the value of inventario
     */
    public function getInventario(): Inventario
    {
        return $this->inventario;
    }

    /**
     * Set the value of inventario
     */
    public function setInventario(Inventario $inventario): self
    {
        $this->inventario = $inventario;

        return $this;
    }
}
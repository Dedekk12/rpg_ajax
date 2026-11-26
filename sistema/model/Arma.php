<?php
require_once (__DIR__ . "/Item.php");
class Arma extends Item{
    private ?int $dano;
    private ?string $tipoDano;
    private ?int $bonus; 
    


    /**
     * Get the value of dano
     */
    public function getDano(): ?int
    {
        return $this->dano;
    }

    /**
     * Set the value of dano
     */
    public function setDano(?int $dano): self
    {
        $this->dano = $dano;

        return $this;
    }

    /**
     * Get the value of tipoDano
     */
    public function getTipoDano(): ?string
    {
        return $this->tipoDano;
    }

    /**
     * Set the value of tipoDano
     */
    public function setTipoDano(?string $tipoDano): self
    {
        $this->tipoDano = $tipoDano;

        return $this;
    }

    /**
     * Get the value of bonus
     */
    public function getBonus(): ?int
    {
        return $this->bonus;
    }

    /**
     * Set the value of bonus
     */
    public function setBonus(?int $bonus): self
    {
        $this->bonus = $bonus;

        return $this;
    }
}
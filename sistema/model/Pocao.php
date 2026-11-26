<?php
require_once(__DIR__ . "/Item.php");

class Pocao extends Item
{
    private ?string $efeito;
    private ?int $bonus;

    

    /**
     * Get the value of efeito
     */
    public function getEfeito(): ?string
    {
        return $this->efeito;
    }

    /**
     * Set the value of efeito
     */
    public function setEfeito(?string $efeito): self
    {
        $this->efeito = $efeito;

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

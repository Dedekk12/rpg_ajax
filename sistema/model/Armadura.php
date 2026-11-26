<?php
require_once(__DIR__ . "/Item.php");

class Armadura extends Item
{
    private ?int $defesa;
    private ?string $material;

    

    /**
     * Get the value of defesa
     */
    public function getDefesa(): ?int
    {
        return $this->defesa;
    }

    /**
     * Set the value of defesa
     */
    public function setDefesa(?int $defesa): self
    {
        $this->defesa = $defesa;

        return $this;
    }

    /**
     * Get the value of material
     */
    public function getMaterial(): ?string
    {
        return $this->material;
    }

    /**
     * Set the value of material
     */
    public function setMaterial(?string $material): self
    {
        $this->material = $material;

        return $this;
    }
}


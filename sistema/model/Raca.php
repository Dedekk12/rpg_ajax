<?php

class Raca
{
    private ?int $id;
    private ?string $nome;
    private ?string $carater;
    private ?int $bonus;


    public function calcBonusF()
    {
        return $this->bonus * 5;
    }

    public function calcBonusM()
    {
        return $this->bonus * 5;
    }

    public function calcBonusA()
    {
        return $this->bonus * 5;
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

    /**
     * Get the value of carater
     */
    public function getCarater(): ?string
    {
        return $this->carater;
    }

    /**
     * Set the value of carater
     */
    public function setCarater(?string $carater): self
    {
        $this->carater = $carater;

        return $this;
    }
}

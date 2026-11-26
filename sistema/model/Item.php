<?php

class Item
{
    private ?int $id;
    private ?string $nome;
    private ?float $peso;
    private ?float $preco;
    private ?string $descricao;
    private ?string $tipo;

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
     * Get the value of peso
     */
    public function getPeso(): ?float
    {
        return $this->peso;
    }

    /**
     * Set the value of peso
     */
    public function setPeso(?float $peso): self
    {
        $this->peso = $peso;

        return $this;
    }

    /**
     * Get the value of preco
     */
    public function getPreco(): ?float
    {
        return $this->preco;
    }

    /**
     * Set the value of preco
     */
    public function setPreco(?float $preco): self
    {
        $this->preco = $preco;

        return $this;
    }

    /**
     * Get the value of descricao
     */
    public function getDescricao(): ?string
    {
        return $this->descricao;
    }

    /**
     * Set the value of descricao
     */
    public function setDescricao(?string $descricao): self
    {
        $this->descricao = $descricao;

        return $this;
    }

    /**
     * Get the value of tipo
     */
    public function getTipo(): ?string
    {
        return $this->tipo;
    }

    /**
     * Set the value of tipo
     */
    public function setTipo(?string $tipo): self
    {
        $this->tipo = $tipo;

        return $this;
    }
}
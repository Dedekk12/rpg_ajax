<?php

class Inventario {
    private ?int $id;
    private ?array $itens;

    public function calcCarga(int $forca) : array{
        $carga = [];

        $cargaMax = $forca * 7.5;
        $pesoAcumulado = 0;
        foreach ($this->itens as $item) {
            $pesoAcumulado += $item->getPeso();
        }

        $carga["max"] = $cargaMax;
        $carga["ocupada"] = $pesoAcumulado;

        if ($pesoAcumulado < (($cargaMax * 30)/100)) {
            $carga["estado"] = "leve";
        }
        elseif ($cargaMax >= $pesoAcumulado) {
            $carga["estado"] = "estável";
        }else{
            $carga["estado"] = "sobrecarga";
        }


        return $carga;
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
     * Get the value of itens
     */
    public function getItens(): ?array
    {
        return $this->itens;
    }

    /**
     * Set the value of itens
     */
    public function setItens(?array $itens): self
    {
        $this->itens = $itens;

        return $this;
    }
}

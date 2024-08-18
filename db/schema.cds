namespace orcamento.db;

entity orcamento {
    key ID          : UUID;

        @Common.Label: 'Tipo de Orçamento'
        tipo        : Association to tipo_orcamento;

        @Common.Label: 'Descrição do Orçamento'
        descricao   : String(255);

        @Common.Label: 'Preço Total do Orçamento'
        preco_total : Decimal(15, 2);
        detalhes    : Composition of many orcamento_detalhes
                          on detalhes.ID = $self;
}

entity tipo_orcamento {
    @Common.Label: 'Tipo de Orçamento'
    tipo      : String(20);

    @Common.Label: 'Descrição do Orçamento'
    descricao : String(255);
}

entity fabricantes {
        @Common.Label: 'Código Fabricante'
    key codigo_fabricante    : String(10);

        @Common.Label: 'Descrição Fabricante'
        descricao_fabricante : String(255);

        @Common.Label: 'Nota no Reclame Aqui'
        nota_reclame_aqui    : Decimal(1, 1);
}

entity orcamento_detalhes {
    key ID             : Association to orcamento;

        @Common.Label: 'Fabricante/Prestadora de Serviço'
        fabricante     : Association to fabricantes @assert.range: true;

        @Common.Label: 'Quantidade'
        quantidade     : Integer                    @default     : 0;

        @Common.Label: 'Preço Unitário'
        preco_unitario : Decimal(15, 2);

        @Common.Label: 'Preço Total'
        preco_total    : Decimal(15, 2);

        @Common.Label: 'Moeda do Serviço/Produto'
        moeda_preco    : String(3)                  @default     : 'BRL';

        @Common.Label: 'Concluido'
        concluido      : Boolean                    @default     : false;
}

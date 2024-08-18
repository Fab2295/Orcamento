using {orcamento.db as db} from '../db/schema';

define service OrcamentoSRV {
    @odata.draft.enabled
    entity Orcamento      as projection on db.orcamento;

    entity Fabricantes    as projection on db.fabricantes;
    entity TipoOrcamentos as projection on db.tipo_orcamento;
}


annotate OrcamentoSRV.Orcamento with @(restrict: [
    {
        grant: '*',
        to   : ['app.admin']
    },
    {
        grant: ['READ'],
        to   : ['app.viewer']
    }
]);


annotate OrcamentoSRV.Fabricantes with @(restrict: [
    {
        grant: '*',
        to   : ['app.admin']
    },
    {
        grant: ['READ'],
        to   : ['app.viewer']
    }
]);

annotate OrcamentoSRV.TipoOrcamentos with @(restrict: [
    {
        grant: '*',
        to   : ['app.admin']
    },
    {
        grant: ['READ'],
        to   : ['app.viewer']
    }
]);

using app.cat from '../db/schema';

//@requires : 'authenticated-user'
service CatalogService {

    @odata.draft.enabled
    //@readonly
    entity Kinds @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable:true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on cat.Kinds{*,} actions {
                 @sap.applicable.path : 'CreateChildEntityEnabled'
        action CreateChildEntity();
    };

    @odata.draft.enabled
    entity Models @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on cat.Models{*,} actions {
                  @sap.applicable.path : 'CreateChildEntityEnabled'
        action CreateChildEntity();
    };

    @odata.draft.enabled
    entity Components @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on cat.Components{*,} actions {
                      @sap.applicable.path : 'CreateChildEntityEnabled'
        action CreateChildEntity();
    };

    @odata.draft.enabled
    entity Adapters @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true},
    }) as projection on cat.Adapters{*,};

    function Count() returns Integer;

}

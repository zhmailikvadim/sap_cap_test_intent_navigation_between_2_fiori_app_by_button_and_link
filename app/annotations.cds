using CatalogService as cs from '../srv/service';

annotate cs.Kinds {
    ID          @readonly;
    name        @title : 'Name';
    description @title : 'Description';
    to_children;
}

annotate cs.Models {
    @readonly
    ID          @title : 'ID';
    name        @title : 'Name' @Common.SemanticObject : 'models_semobj';
    description @title : 'Description';
    ID_parent   @title : 'IdKind';
    to_children;
};

annotate cs.Components {
    ID          @readonly;
    name        @title : 'Name';
    description @title : 'Description';
    ID_parent   @title : 'ID_Model';
    to_children;
};

annotate cs.Adapters {
    ID          @readonly;
    name        @title : 'Name';
    description @title : 'Description';
    ID_parent   @title : 'ID_Component';
};

annotate cs.Adapters with @UI : {
    PresentationVariant            : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]
    },
    Identification                 : [
        {Value : name},
        {Value : description},
    ],
    SelectionFields                : [
        name,
        description
    ],
    HeaderInfo                     : {
        TypeName       : 'Adapter',
        TypeNamePlural : 'Adapters',
        Title          : {
            $Type : 'UI.DataField',
            Value : name
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description
        }
    },
    LineItem                       : [
        {
            Value : name,
            Label : 'Adapter'
        },
        {Value : description},
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.CreateChildEntity',
            Label  : 'CreateChildEntity'
        },
    ],

    Facets                         : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Model',
        ID     : 'Adapter',
        Facets : [
            {
                $Type  : 'UI.ReferenceFacet',
                ID     : 'AdapterData',
                Target : '@UI.FieldGroup#MainData',
                Label  : 'Adapter'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : 'administrativeData',
                Target : '@UI.FieldGroup#AdministrativeData'
            },
        ],

    }],
    FieldGroup #MainData           : {
        $Type : 'UI.FieldGroupType',
        Label : 'Model',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : description
            },
        ]
    },
    FieldGroup #AdministrativeData : {
        Label : 'administrativeData',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : ID_parent_ID
            },
        ]
    }
};


annotate cs.Components with @UI : {
    PresentationVariant            : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]
    },
    Identification                 : [
        {Value : name},
        {Value : description},
    ],
    SelectionFields                : [
        name,
        description
    ],
    HeaderInfo                     : {
        TypeName       : 'Component',
        TypeNamePlural : 'Components',
        Title          : {
            $Type : 'UI.DataField',
            Value : name
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description
        }
    },
    LineItem                       : [
        {
            Value : name,
            Label : 'Component'
        },
        {Value : description},
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.CreateChildEntity',
            Label  : 'CreateChildEntity'
        },
    ],

    Facets                         : [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : 'Model',
            ID     : 'Component',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    ID     : 'ComponentData',
                    Target : '@UI.FieldGroup#MainData',
                    Label  : 'Component'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : 'administrativeData',
                    Target : '@UI.FieldGroup#AdministrativeData'
                },
            ],

        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_children/@UI.LineItem',
            Label  : 'Adapters'
        }
    ],
    FieldGroup #MainData           : {
        $Type : 'UI.FieldGroupType',
        Label : 'Model',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : description
            },
        ]
    },
    FieldGroup #AdministrativeData : {
        Label : 'administrativeData',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : ID_parent_ID
            },
        ]
    }
};


annotate cs.Models with @UI : {
    CreateHidden                   : false,
    PresentationVariant            : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]
    },
    Identification                 : [
        {Value : name},
        {Value : description},
    ],
    SelectionFields                : [
        name,
        description
    ],
    HeaderInfo                     : {
        TypeName       : 'Model',
        TypeNamePlural : 'Models',
        Title          : {
            $Type : 'UI.DataField',
            Value : name
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description
        }
    },
    LineItem                       : [
        {
            Value : name,
            Label : 'Model'
        },
        {Value : description},
        {Value : ID_parent_ID},
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.CreateChildEntity',
            Label  : 'CreateChildEntity'
        },
        {
            $Type           : 'UI.DataFieldForIntentBasedNavigation',
            SemanticObject  : 'models_semobj',
            Action          : 'manage',
            Label           : 'IntentNavigation',
            RequiresContext : true
        },
    ],

    Facets                         : [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : 'Model',
            ID     : 'Model',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    ID     : 'ModelData',
                    Target : '@UI.FieldGroup#MainData',
                    Label  : 'Kind'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : 'administrativeData',
                    Target : '@UI.FieldGroup#AdministrativeData'
                },
            ]
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_children/@UI.LineItem',
            Label  : 'Cmponents'
        }
    ],
    FieldGroup #MainData           : {
        $Type : 'UI.FieldGroupType',
        Label : 'Model',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : description
            },
            {
                $Type : 'UI.DataField',
                Value : ID_parent_ID
            },
        ]
    },
    FieldGroup #AdministrativeData : {
        Label : 'administrativeData',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : ID_parent_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : ID,
            }
        ]
    }
};


annotate cs.Kinds with @UI : {
    PresentationVariant            : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]
    },
    Identification                 : [
        {Value : name},
        {Value : description},
    ],
    SelectionFields                : [
        name,
        description
    ],
    HeaderInfo                     : {
        TypeName       : 'Kind',
        TypeNamePlural : 'Kinds',
        Title          : {
            $Type : 'UI.DataField',
            Value : name
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description
        }
    },
    LineItem                       : [
        {Value : name},
        {Value : description},
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.CreateChildEntity',
            Label  : 'CreateChildEntity'
        },
        {
            $Type           : 'UI.DataFieldForIntentBasedNavigation',
            SemanticObject  : 'components_semobj',
            Action          : 'manage?id=''50''',
            Label           : 'IntentNavigation',
            RequiresContext : true
        },
    ],

    Facets                         : [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : 'Kind',
            ID     : 'Kind',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    ID     : 'KindData',
                    Target : '@UI.FieldGroup#MainData',
                    Label  : 'Kind'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : 'administrativeData',
                    Target : '@UI.FieldGroup#AdministrativeData'
                },
            ]
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_children/@UI.LineItem',
            Label  : 'Models'
        }
    ],
    FieldGroup #MainData           : {
        $Type : 'UI.FieldGroupType',
        Label : 'Kind',
        Data  : [

            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : description
            },
        ]
    },
    FieldGroup #AdministrativeData : {
        Label : 'administrativeData',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
        ]
    }
};

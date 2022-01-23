namespace app.cat;

using {
    custom.managed,
    TextInfo
} from './common';
using {cuid} from '@sap/cds/common';

type Name : String(50);
type LDescription : String(500);
type tyIntentNavigationString : String(200);

entity Kinds : cuid, managed, TextInfo {
    key ID          : UUID;

        to_children : Association to many Models
                          on to_children.ID_parent = $self;
};

entity Models : cuid, managed, TextInfo {
    key ID                   : UUID;
        ID_parent            : Association to Kinds;
        to_children          : Association to many Components
                                   on to_children.ID_parent = $self;
};

entity Components : cuid, managed, TextInfo {
    key ID          : UUID;
        ID_parent   : Association to Models;
        to_children : Association to many Adapters
                          on to_children.ID_parent = $self
};

entity Adapters : cuid, managed, TextInfo {
    key ID        : UUID;
        ID_parent : Association to Components;
}

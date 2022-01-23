using {managed} from '@sap/cds/common';

type Name : String(50);
type LDescription : String(500);

aspect custom.managed {
    createdAt     : managed:createdAt;
    createdBy     : managed:createdBy;
    LastChangedAt : managed:modifiedAt;
    LastChangedBy : managed:modifiedBy;
}

aspect TextInfo {
    name        : Name;
    description : LDescription;
}
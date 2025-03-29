namespace cap.dogadaption;

using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';

entity Animals : cuid {
    name : String;
    breed : String;
    age : Integer;
    species : Assocation to one Species;
    healthStatus : Association to one HealthStatus;
    adoptionStatus : Association to one AdoptionStatus;
    adopter: Association to one Adopters;
    displayName : String = name || ' - (' || species.name || ')';
}

entity Species : CodeList {
    key code : String enum {
        Cat = 'CA';
        Rabbit = 'RB';
        Bird = 'BD';
        Dog = 'DG';
    }
}

entity HealthStatus : CodeList {
    key code: String enum {
        Healthy = "H";
        RequireAttention = "RA";
        Critical = "C";
    };
    criticality : Integer;
}

entity AdoptionStatus : CodeList {
    key code : String enum {
        Available = "A";
        Pending = "P";
        Adopted = "AD";
    }
}

entity Adopters: cuid, managed {
    name : String;
    email : String @asset.format: '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    phone : String @asset.format: '^\d{10}$';
    virtual update : Boolean;
}

entity AdaptionApplication: cuid, managed {
    animal : Association to one Animals;
    adopter : Association to one Adopters;
    applicationDate : type of managed : createdAt;
    applicationSummary : String(100);

}



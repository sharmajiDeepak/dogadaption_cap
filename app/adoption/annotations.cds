using AnimalAdoption as service from '../../srv/service';
using from '../../db/Schema';

annotate service.Animals with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'breed',
                Value : breed,
            },
            {
                $Type : 'UI.DataField',
                Label : 'age',
                Value : age,
            },
            {
                $Type : 'UI.DataField',
                Label : 'species_code',
                Value : species_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'healthStatus_code',
                Value : healthStatus_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'adoptionStatus_code',
                Value : adoptionStatus_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'displayName',
                Value : displayName,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Details}',
            ID : 'i18nDetails',
            Target : '@UI.FieldGroup#i18nDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Adopter Details',
            ID : 'AdopterDetails',
            Target : '@UI.FieldGroup#AdopterDetails',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : displayName,
            Label : '{i18n>Name}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Breed}',
            Value : breed,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Age}',
            Value : age,
        },
        {
            $Type : 'UI.DataField',
            Value : healthStatus_code,
            Criticality : healthStatus.criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : adoptionStatus_code,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'AnimalAdoption.adopt',
            Label : '{i18n>Adopt}',
            Inline : true,
            Criticality : #Positive,
        },
    ],
    UI.SelectionFields : [
        adoptionStatus_code,
        healthStatus_code,
        species_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : displayName,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : breed,
        },
    },
    UI.FieldGroup #i18nDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : breed,
                Label : 'breed',
            },
            {
                $Type : 'UI.DataField',
                Value : age,
                Label : 'age',
            },
            {
                $Type : 'UI.DataField',
                Value : healthStatus_code,
                Criticality : healthStatus.criticality,
                CriticalityRepresentation : #WithIcon,
            },
            {
                $Type : 'UI.DataField',
                Value : adoptionStatus_code,
            },
            {
                $Type : 'UI.DataField',
                Value : species_code,
            },
        ],
    },
    UI.FieldGroup #AdopterDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : adopter.name,
                Label : '{i18n>Name}',
            },
            {
                $Type : 'UI.DataField',
                Value : adopter.email,
                Label : '{i18n>Email}',
            },
            {
                $Type : 'UI.DataField',
                Value : adopter.phone,
                Label : '{i18n>Phone}',
            },
        ],
    },
);

annotate service.Animals with {
    adoptionStatus @(
        Common.Label : '{i18n>AdoptionStatus}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'AdoptionStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : adoptionStatus_code,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : adoptionStatus.name,
    )
};

annotate service.Animals with {
    healthStatus @(
        Common.Label : '{i18n>HealthStatus}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'HealthStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : healthStatus_code,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : healthStatus.name,
    )
};

annotate service.Animals with {
    species @Common.Label : '{i18n>Species}'
};

annotate service.HealthStatus with {
    name @Common.Text : {
        $value : code,
        ![@UI.TextArrangement] : #TextLast,
    }
};

annotate service.adoptionInput with {
    name @Common.Label: 'Adopting Pet Name';
    applicationSummary @Common : { Label : 'Summary', };
    address @Common : { Label : 'Address', };
    phone @Common : { Label : 'Phone Number', };
    email @Common : { Label : 'Email Address', };
    update @Common : { Label : 'Update', }

} ;



using AnimalAdoption as service from '../../srv/service';
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
    ],
    UI.LineItem : [
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
    ],
);


using {cap.dogadaption as dbmodel} from '../db/Schema';

service AnimalAdoption {

    type adoptionInput {
        name : String;
        email : String @assert.format: '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
        phone : String @assert.format : '^\d{10}$';
        applicationSummary : String(50);
        address: String;
        update: Boolean
    }

    entity Animals @(restrict: [{
        grant: ['READ'], to: ['Adopter']
    }, { grant:['*'], to: ['Admin']}]) as projection on dbmodel.Animals actions {
        @Common.DefaultValuesFunction : 'AnimalAdoption.getDefaults'
        @Common.SideEffects : {TargetEntities : [_currentRow]}
        @cds.odata.bindingparameter.name: '_currentRow'
        action adopt @(restrict: ['CREATE', 'UPDATE'], to:'Adopter')(
            @UI.ParameterDefaultValue:_currentRow.displayName
            name: adoptionInput:name,
            email : adoptionInput:email,
            phone : adoptionInput:phone,
            @UI.MultiLineText:true
            applicationSummary : adoptionInput:applicationSummary,
            @UI.MultiLineText:true
            address: adoptionInput:address,
            update : adoptionInput:update
        );
        function getDefaults @(restrict: ['READ'], to:'Adopter')() returns adoptionInput;
    };
    entity AdopterDetails as projection on dbmodel.Adopters;
    entity AdoptionApplication as select from dbmodel.AdaptionApplication
    where createdBy = $user.id;

}

//annotate AnimalAdoption with @(requires:'Adopter');

service AdminService {

    entity AdoptionApplication as projection on dbmodel.AdaptionApplication;
    entity Animals as projection on dbmodel.Animals;

}

//annotate AdminService with @(requires: 'Admin');


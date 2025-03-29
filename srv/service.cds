using {cap.dogadaption as dbmodel} from '../db/Schema';

service AnimalAdoption {

    entity Animals as projection on dbmodel.Animals;
    entity AdoptionApplication as select from dbmodel.AdaptionApplication
    where createdBy = $user.id;

}

annotate AnimalAdoption with @(requires:'Adopter');

service AdminService {

    entity AdoptionApplication as projection on dbmodel.AdaptionApplication;
    entity Animals as projection on dbmodel.Animals;

}

annotate AdminService with @(requires: 'Admin');


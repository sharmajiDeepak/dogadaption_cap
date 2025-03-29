const cds = require("@sap/cds");

module.exports = class AnimalAdoption extends cds.ApplicationService {
    init() {

        this.on("adopt", "Animals", async (req) => {
            console.log("req", req);
            console.log("data", req.data);
            console.log("update", req.data.update);
            console.log("user", req.user);

            const {update} = req.data;

            //get the Adopter ID
            const adopterID = await this.getAdopterID(req);
            const animalID = req.params[0];
            const {applicationSummary} = req.data;
            console.log("AdopterID", adopterID);
            console.log("param", animalID);

            await this.createAdoptionApplication(animalID, adopterID, applicationSummary);
            await this.updateAnimalAdoptionStatus(animalID, adopterID);

            if (update) {
               const oUpdateQuery = await this.updateAdopterDetail(req, adopterID);
            }
        });

        return super.init();
    }

    async getAdopterID(req) {
        const {name, email, phone, address, update} = req.data;
        const {Adopters} = cds.entities;
        let AdopterID;
        const result = await SELECT.one(Adopters, A=> A.ID).where({
            createdBy: req.user.id
        });

        if(!result) {
          await INSERT.into(Adopters).entries({
                name: name,
                email: email,
                phone: phone,
                address: address,
            });

            const {ID} = await SELECT.one(Adopters, A=> A.ID).where({
                createdBy: req.user.id
            });
            AdopterID = ID;
        } else {
            AdopterID = result.ID;
        }

        return AdopterID;
    }

    async updateAdopterDetail(req, adopterID) {
        const {name, email, phone, address} = req.data;
        const {Adopters} = cds.entities;
        await UPDATE.entity(Adopters).with({
            email: email,
            name: name,
            phone: phone,
            address: address
        }).where({ID: adopterID})
    }

    async createAdoptionApplication(animalID, adopterID, applicationSummary) {
        console.log("create adoption", animalID, adopterID, applicationSummary);
        const {AdaptionApplication} = cds.entities;
        await INSERT.into(AdaptionApplication).entries({
            animal_ID: animalID,
            adopter_ID: adopterID,
            applicationSummary: applicationSummary
        });

    }

    async updateAnimalAdoptionStatus(animalID, adopterID) {
        console.log("animal adoption", animalID, adopterID);
        const {Animals} = cds.entities;
        await UPDATE.entity(Animals).with({
            adopter_ID: adopterID,
            adoptionStatus_code: 'P'
        }).where({ID:animalID})
    }

    async getDefaults(req) {
        const {Adopters} = cds.entities;
        const {user} = cds.context;
        const result = await SELECT.one(Adopters).columns("phone", "email", "address").where({createdBy: user.id})
        console.log("result", result)
        if (result) {
            const {email, phone, address} = result;
            return {
                name : "",
                email : email,
                phone : phone,
                applicationSummary : "",
                address: address
            }
        } else {
            return {
                name : "",
                email : "",
                phone : "",
                applicationSummary : "",
                address: ""
            }
        }
       
    }
}
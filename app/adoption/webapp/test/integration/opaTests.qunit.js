sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'adoption/test/integration/FirstJourney',
		'adoption/test/integration/pages/AnimalsList',
		'adoption/test/integration/pages/AnimalsObjectPage'
    ],
    function(JourneyRunner, opaJourney, AnimalsList, AnimalsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('adoption') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheAnimalsList: AnimalsList,
					onTheAnimalsObjectPage: AnimalsObjectPage
                }
            },
            opaJourney.run
        );
    }
);
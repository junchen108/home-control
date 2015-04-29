package controllers;

import akka.actor.UntypedActor;
import models.Measures.Measure;

/**
 * Created by Jun Chen on 29/04/15.
 */
public class MockActor extends UntypedActor {

    @Override
    public void onReceive(Object message) throws Exception {
        createMeasureAndSaveToDB();
    }

    private void createMeasureAndSaveToDB() {
        Measure measure = Measure.createMeasure();
        measure.save("measures");
    }

}

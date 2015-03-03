package controllers;

import akka.actor.UntypedActor;
import controllers.Application;

public class DataRefreshActor extends UntypedActor {

    @Override
    public void onReceive(Object message) throws Exception {
        Application.addEnvironmentData();
    }

}

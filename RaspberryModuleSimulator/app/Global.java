import akka.actor.ActorRef;
import akka.actor.Props;
import controllers.MockActor;
import play.Application;
import play.GlobalSettings;
import play.libs.Akka;
import scala.concurrent.duration.Duration;

import java.util.concurrent.TimeUnit;

/**
 * Created by Jun Chen on 29/04/15.
 */
public class Global extends GlobalSettings {

    @Override
    public void onStart(Application application) {
        ActorRef generateMockActor = Akka.system().actorOf(Props.create(MockActor.class));
        Akka.system().scheduler().schedule(
                Duration.create(2000, TimeUnit.MILLISECONDS),
                Duration.create(15000, TimeUnit.MILLISECONDS),
                generateMockActor,
                "new measure generated",
                Akka.system().dispatcher(),
                null
        );

    }

}

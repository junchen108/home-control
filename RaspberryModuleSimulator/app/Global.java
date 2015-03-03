import akka.actor.ActorRef;
import akka.actor.Props;
import controllers.DataRefreshActor;
import play.Application;
import play.GlobalSettings;
import play.libs.Akka;
import scala.concurrent.duration.Duration;

import java.util.concurrent.TimeUnit;

public class Global extends GlobalSettings {

    @Override
    public void onStart(Application application) {
        ActorRef dataRefreshActor = Akka.system().actorOf(Props.create(DataRefreshActor.class));
        Akka.system().scheduler().schedule(
                Duration.create(2000, TimeUnit.MILLISECONDS),
                Duration.create(3000, TimeUnit.MILLISECONDS),
                dataRefreshActor,
                "refresh data",
                Akka.system().dispatcher(),
                null
        );
    }

}

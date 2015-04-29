import play.Logger;
import play.Application;
import play.GlobalSettings;

/**
 * Created by Jun Chen on 29/04/15.
 */
public class Global extends GlobalSettings {

    @Override
    public void onStart(Application application) {
        Logger.info("Application has started");
    }

}

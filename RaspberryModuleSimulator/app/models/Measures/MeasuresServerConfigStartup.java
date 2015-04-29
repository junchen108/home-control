package models.Measures;

import com.avaje.ebean.config.ServerConfig;
import com.avaje.ebean.event.ServerConfigStartup;

/**
 * Created by Jun Chen on 29/04/15.
 */
public class MeasuresServerConfigStartup implements ServerConfigStartup {

    @Override
    public void onStart(ServerConfig serverConfig) {
        serverConfig.setDatabaseSequenceBatchSize(1);
    }

}

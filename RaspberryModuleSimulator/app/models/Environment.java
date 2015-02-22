package models;

import javax.persistence.Entity;
import javax.persistence.Id;

import play.db.ebean.Model;

@Entity
public class Environment extends Model {

    // TODO Choose a good type and make these things private
    
    @Id
    public String id;
    
    public String temperature;
    
    public String date;
    
}

package models;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

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
    
    public Environment(String temperature, String date) {
        this.temperature = temperature;
        this.date = date;
    }
    
    public static Environment generateEnvironmentData() {
        Random randomGenerator = new Random();
        Integer randomInteger = new Integer(randomGenerator.nextInt(100));
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String time = dateFormat.format(Calendar.getInstance().getTime());
        
        return new Environment(randomInteger.toString(), time);
    }
    
}

package models.Measures;

import play.data.format.Formats;
import play.data.validation.Constraints;
import play.db.ebean.Model;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by Jun Chen on 29/04/15.
 */
@Entity
public class Measure extends Model {

    @Id
    public Long id;

    @Constraints.Required
    public Double value;

    @Constraints.Required
    public String unit;

    @Formats.DateTime(pattern="yyyy/MM/dd HH:mm")
    public Date measuredDate = new Date();

    // TODO Constructor

    public static Finder<Long, Measure> find = new Finder<Long, Measure>(
            "measures", Long.class, Measure.class
    );

}

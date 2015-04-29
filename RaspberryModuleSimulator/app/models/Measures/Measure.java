package models.Measures;

import com.fasterxml.jackson.annotation.JsonFormat;
import play.data.validation.Constraints;
import play.db.ebean.Model;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;
import java.util.List;

/**
 * Created by Jun Chen on 29/04/15.
 */
@Entity
public class Measure extends Model {

    private static double CURRENT_VALUE = 25.0;

    @Id
    public Long id;

    @Constraints.Required
    public double value;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    public Date date;

    private Measure(double value) {
        this.value = value;
        date = new Date();
    }

    public static Measure createMeasure() {
        double current = CURRENT_VALUE;
        CURRENT_VALUE += 0.23;
        return new Measure(current);
    }

    public static Finder<Long, Measure> find = new Finder<Long, Measure>(
            "measures", Long.class, Measure.class
    );

    public static Measure getLastMeasure() {
        List<Measure> measures = Measure.find.all();
        return measures.get(measures.size() - 1);
    }

    public static List<Measure> getAllMeasures() {
        return Measure.find.all();
    }

}

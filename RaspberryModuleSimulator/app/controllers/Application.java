package controllers;

import models.Measures.Measure;
import play.libs.Json;
import play.mvc.*;

import views.html.*;

import java.util.List;

public class Application extends Controller {

    public static Result index() {
        return ok(index.render("Simulator"));
    }

    public static Result getLastValue() {
        Measure lastMeasure = Measure.getLastMeasure();
        return ok(Json.toJson(lastMeasure));
    }

    public static Result getAllValues() {
        List<Measure> measures = Measure.getAllMeasures();
        return ok(Json.toJson(measures));
    }

}

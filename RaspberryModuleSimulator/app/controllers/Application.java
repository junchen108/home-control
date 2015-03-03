package controllers;

import java.util.List;
import java.util.Timer;

import models.Environment;
import play.data.Form;
import play.db.ebean.Model;
import play.libs.Json;
import play.mvc.*;
import views.html.*;

public class Application extends Controller {

    public static Result index() {
        return ok(index.render("Welcome!"));
    }
    
    public static Result addEnvironmentData() {
        Environment environment = Environment.generateEnvironmentData();
        environment.save();
        return redirect(routes.Application.index());
    }
    
    public static Result getEnvironmentData() {
        List<Environment> environmentDataList = new Model.Finder(String.class, Environment.class).all();
        return ok(Json.toJson(environmentDataList));
    }

}

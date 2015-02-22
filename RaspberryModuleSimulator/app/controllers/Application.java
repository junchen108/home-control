package controllers;

import java.util.List;

import models.Environment;
import play.data.Form;
import play.db.ebean.Model;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.*;

public class Application extends Controller {

    public static Result index() {
        return ok(index.render("Evironment Data"));
    }

    public static Result addEnvironmentData() {
        Environment environment = Form.form(Environment.class).bindFromRequest().get();
        environment.save();
        return redirect(routes.Application.index());
    }
    
    public static Result getEnvironmentData() {
        List<Environment> environmentDataList = new Model.Finder(String.class, Environment.class).all();
        return ok(Json.toJson(environmentDataList));
    }

}

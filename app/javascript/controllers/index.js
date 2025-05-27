// app/javascript/controllers/index.js

import { Application } from "@hotwired/stimulus";
import ConfessionModalController from "./confession_modal_controller";
import TabsController from "./tabs_controller";
import ReactionController from "./reaction_controller";

const application = Application.start();

application.register("modal", ConfessionModalController);
application.register("tabs", TabsController);
application.register("reaction", ReactionController);

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// External imports
import "bootstrap";

// Internal imports
import { initToogleSidebar } from '../plugins/init_toggle_sidebar';
import { initMapbox} from '../plugins/init_mapbox';
import { initStarRating } from '../plugins/init_star_rating';
import { initChatroomCable } from '../channels/chatroom_channel';

document.addEventListener('turbolinks:load', () => {
  initToogleSidebar();
  initStarRating();
  initMapbox();
  initChatroomCable();
});
